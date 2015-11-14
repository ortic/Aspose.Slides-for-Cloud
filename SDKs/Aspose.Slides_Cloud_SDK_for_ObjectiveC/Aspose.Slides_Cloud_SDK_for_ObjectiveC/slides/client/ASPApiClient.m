#import "ASPApiClient.h"
#include <CommonCrypto/CommonHMAC.h>

#if __LP64__
#define NSI "ld"
#define NSU "lu"
#else
#define NSI "d"
#define NSU "u"
#endif

NSString *const ASPResponseObjectErrorKey = @"ASPResponseObject";

static long requestId = 0;
static bool offlineState = false;
static NSMutableSet * queuedRequests = nil;
static bool cacheEnabled = false;
static AFNetworkReachabilityStatus reachabilityStatus = AFNetworkReachabilityStatusNotReachable;
static void (^reachabilityChangeBlock)(int);
static NSString *appSID; // Represents AppSID for the app.
static NSString *appKey; // Represents AppKey for the app.

@implementation ASPApiClient

- (instancetype)init {
    NSString *baseUrl = [[ASPConfiguration sharedConfig] host];
    return [self initWithBaseURL:[NSURL URLWithString:baseUrl]];
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        // configure reachability
        [self configureCacheReachibility];
    }
    return self;
}

+ (void)initialize {
    if (self == [ASPApiClient class]) {
        queuedRequests = [[NSMutableSet alloc] init];
        // initialize URL cache
        [self configureCacheWithMemoryAndDiskCapacity:4*1024*1024 diskSize:32*1024*1024];
    }
}

+ (void) setAppKey:(NSString *) app_Key andAppSID:(NSString *) app_SID {
    appKey = app_Key;
    appSID = app_SID;
}

#pragma mark - Setter Methods

+ (void) setOfflineState:(BOOL) state {
    offlineState = state;
}

+ (void) setCacheEnabled:(BOOL)enabled {
    cacheEnabled = enabled;
}

- (void)setHeaderValue:(NSString*) value
                forKey:(NSString*) forKey {
    [self.requestSerializer setValue:value forHTTPHeaderField:forKey];
}

#pragma mark - Log Methods

- (void)logResponse:(AFHTTPRequestOperation *)operation
         forRequest:(NSURLRequest *)request
              error:(NSError*)error {
    ASPConfiguration *config = [ASPConfiguration sharedConfig];

    NSString *message = [NSString stringWithFormat:@"\n[DEBUG] Request body \n~BEGIN~\n %@\n~END~\n"\
                         "[DEBUG] HTTP Response body \n~BEGIN~\n %@\n~END~\n",
                        [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding],
                        operation.responseString];

    if (config.loggingFileHanlder) {
        [config.loggingFileHanlder seekToEndOfFile];
        [config.loggingFileHanlder writeData:[message dataUsingEncoding:NSUTF8StringEncoding]];
    }

    NSLog(@"%@", message);
}

#pragma mark - Cache Methods

+(void)clearCache {
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

+(void)configureCacheWithMemoryAndDiskCapacity: (unsigned long) memorySize
                                      diskSize: (unsigned long) diskSize {
    NSAssert(memorySize > 0, @"invalid in-memory cache size");
    NSAssert(diskSize >= 0, @"invalid disk cache size");

    NSURLCache *cache =
    [[NSURLCache alloc]
     initWithMemoryCapacity:memorySize
     diskCapacity:diskSize
     diskPath:@"swagger_url_cache"];

    [NSURLCache setSharedURLCache:cache];
}

#pragma mark - Utility Methods

/*
 * Detect `Accept` from accepts
 */
+ (NSString *) selectHeaderAccept:(NSArray *)accepts
{
    if (accepts == nil || [accepts count] == 0) {
        return @"";
    }

    NSMutableArray *lowerAccepts = [[NSMutableArray alloc] initWithCapacity:[accepts count]];
    [accepts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [lowerAccepts addObject:[obj lowercaseString]];
    }];


    if ([lowerAccepts containsObject:@"application/json"]) {
        return @"application/json";
    }
    else {
        return [lowerAccepts componentsJoinedByString:@", "];
    }
}

/*
 * Detect `Content-Type` from contentTypes
 */
+ (NSString *) selectHeaderContentType:(NSArray *)contentTypes
{
    if (contentTypes == nil || [contentTypes count] == 0) {
        return @"application/json";
    }

    NSMutableArray *lowerContentTypes = [[NSMutableArray alloc] initWithCapacity:[contentTypes count]];
    [contentTypes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [lowerContentTypes addObject:[obj lowercaseString]];
    }];

    if ([lowerContentTypes containsObject:@"application/json"]) {
        return @"application/json";
    }
    else {
        return lowerContentTypes[0];
    }
}

+ (NSString*)escape:(id)unescaped {
    if([unescaped isKindOfClass:[NSString class]]){
        return (NSString *)CFBridgingRelease
        (CFURLCreateStringByAddingPercentEscapes(
                                                 NULL,
                                                 (__bridge CFStringRef) unescaped,
                                                 NULL,
                                                 (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                 kCFStringEncodingUTF8));
    }
    else {
        return [NSString stringWithFormat:@"%@", unescaped];
    }
}

#pragma mark - Request Methods

+(unsigned long)requestQueueSize {
    return [queuedRequests count];
}

+(NSNumber*) nextRequestId {
    @synchronized(self) {
        long nextId = ++requestId;
        if([[ASPConfiguration sharedConfig] debug])
            NSLog(@"got id %ld", nextId);
        return [NSNumber numberWithLong:nextId];
    }
}

+(NSNumber*) queueRequest {
    NSNumber* requestId = [ASPApiClient nextRequestId];
    if([[ASPConfiguration sharedConfig] debug])
        NSLog(@"added %@ to request queue", requestId);
    [queuedRequests addObject:requestId];
    return requestId;
}

+(void) cancelRequest:(NSNumber*)requestId {
    [queuedRequests removeObject:requestId];
}

-(Boolean) executeRequestWithId:(NSNumber*) requestId {
    NSSet* matchingItems = [queuedRequests objectsPassingTest:^BOOL(id obj, BOOL *stop) {
        if([obj intValue]  == [requestId intValue]) {
            return YES;
        }
        else {
            return NO;
        }
    }];

    if(matchingItems.count == 1) {
        if([[ASPConfiguration sharedConfig] debug])
            NSLog(@"removing request id %@", requestId);
        [queuedRequests removeObject:requestId];
        return YES;
    }
    else {
        return NO;
    }
}

#pragma mark - Reachability Methods

+(AFNetworkReachabilityStatus) getReachabilityStatus {
    return reachabilityStatus;
}

+(void) setReachabilityChangeBlock:(void(^)(int))changeBlock {
    reachabilityChangeBlock = changeBlock;
}

- (void) configureCacheReachibility {
    [self.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        reachabilityStatus = status;
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                if([[ASPConfiguration sharedConfig] debug])
                    NSLog(@"reachability changed to AFNetworkReachabilityStatusUnknown");
                [ASPApiClient setOfflineState:true];
                break;

            case AFNetworkReachabilityStatusNotReachable:
                if([[ASPConfiguration sharedConfig] debug])
                    NSLog(@"reachability changed to AFNetworkReachabilityStatusNotReachable");
                [ASPApiClient setOfflineState:true];
                break;

            case AFNetworkReachabilityStatusReachableViaWWAN:
                if([[ASPConfiguration sharedConfig] debug])
                    NSLog(@"reachability changed to AFNetworkReachabilityStatusReachableViaWWAN");
                [ASPApiClient setOfflineState:false];
                break;

            case AFNetworkReachabilityStatusReachableViaWiFi:
                if([[ASPConfiguration sharedConfig] debug])
                    NSLog(@"reachability changed to AFNetworkReachabilityStatusReachableViaWiFi");
                [ASPApiClient setOfflineState:false];
                break;
            default:
                break;
        }

        // call the reachability block, if configured
        if(reachabilityChangeBlock != nil) {
            reachabilityChangeBlock(status);
        }
    }];

    [self.reachabilityManager startMonitoring];
}

#pragma mark - Deserialize methods

- (id) deserialize:(id) data class:(NSString *) class {
    NSRegularExpression *regexp = nil;
    NSTextCheckingResult *match = nil;
    NSMutableArray *resultArray = nil;
    NSMutableDictionary *resultDict = nil;
    NSString *innerType = nil;

    // return nil if data is nil or class is nil
    if (!data || !class) {
        return nil;
    }

    // remove "*" from class, if ends with "*"
    if ([class hasSuffix:@"*"]) {
        class = [class substringToIndex:[class length] - 1];
    }

    // pure object
    if ([class isEqualToString:@"NSObject"]) {
        return [[NSObject alloc] init];
    }

    // list of models
    NSString *arrayOfModelsPat = @"NSArray<(.+)>";
    regexp = [NSRegularExpression regularExpressionWithPattern:arrayOfModelsPat
                                                      options:NSRegularExpressionCaseInsensitive
                                                        error:nil];

    match = [regexp firstMatchInString:class
                               options:0
                                 range:NSMakeRange(0, [class length])];

    if (match) {
        innerType = [class substringWithRange:[match rangeAtIndex:1]];

        resultArray = [NSMutableArray arrayWithCapacity:[data count]];
        [data enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                [resultArray addObject:[self deserialize:obj class:innerType]];
            }
        ];

        return resultArray;
    }

    // list of primitives
    NSString *arrayOfPrimitivesPat = @"NSArray\\* /\\* (.+) \\*/";
    regexp = [NSRegularExpression regularExpressionWithPattern:arrayOfPrimitivesPat
                                                       options:NSRegularExpressionCaseInsensitive
                                                         error:nil];
    match = [regexp firstMatchInString:class
                               options:0
                                 range:NSMakeRange(0, [class length])];

    if (match) {
        innerType = [class substringWithRange:[match rangeAtIndex:1]];

        resultArray = [NSMutableArray arrayWithCapacity:[data count]];
        [data enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [resultArray addObject:[self deserialize:obj class:innerType]];
        }];

        return resultArray;
    }

    // map
    NSString *dictPat = @"NSDictionary\\* /\\* (.+?), (.+) \\*/";
    regexp = [NSRegularExpression regularExpressionWithPattern:dictPat
                                                       options:NSRegularExpressionCaseInsensitive
                                                         error:nil];
    match = [regexp firstMatchInString:class
                               options:0
                                 range:NSMakeRange(0, [class length])];

    if (match) {
        NSString *valueType = [class substringWithRange:[match rangeAtIndex:2]];

        resultDict = [NSMutableDictionary dictionaryWithCapacity:[data count]];
        [data enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            [resultDict setValue:[self deserialize:obj class:valueType] forKey:key];
        }];

        return resultDict;
    }

    // primitives
    NSArray *primitiveTypes = @[@"NSString", @"NSDate", @"NSNumber"];

    if ([primitiveTypes containsObject:class]) {
        if ([class isEqualToString:@"NSString"]) {
            return [NSString stringWithString:data];
        }
        else if ([class isEqualToString:@"NSDate"]) {
            return [NSDate dateWithISO8601String:data];
        }
        else if ([class isEqualToString:@"NSNumber"]) {
            // NSNumber from NSNumber
            if ([data isKindOfClass:[NSNumber class]]) {
                return data;
            }
            else if ([data isKindOfClass:[NSString class]]) {
                // NSNumber (NSCFBoolean) from NSString
                if ([[data lowercaseString] isEqualToString:@"true"] || [[data lowercaseString] isEqualToString:@"false"]) {
                    return [NSNumber numberWithBool:[data boolValue]];
                // NSNumber from NSString
                } else {
                    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
                    formatter.numberStyle = NSNumberFormatterDecimalStyle;
                    return [formatter numberFromString:data];
                }
            }
        }
    }

   // model
    Class ModelClass = NSClassFromString(class);
    if ([ModelClass instancesRespondToSelector:@selector(initWithDictionary:error:)]) {
        return [[ModelClass alloc] initWithDictionary:data error:nil];
    }

    return nil;
}

#pragma mark - Operation Methods

- (void) operationWithCompletionBlock: (NSURLRequest *)request
                            requestId: (NSNumber *) requestId
                      completionBlock: (void (^)(id, NSError *))completionBlock {
    
    AFHTTPRequestOperation *op = [self HTTPRequestOperationWithRequest:request
                                                               success:^(AFHTTPRequestOperation *operation, id response) {
                                                                   if([self executeRequestWithId:requestId]) {
                                                                       if([[ASPConfiguration sharedConfig] debug]) {
                                                                           [self logResponse:operation forRequest:request error:nil];
                                                                       }
                                                                       completionBlock(response, nil);
                                                                   }
                                                               } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                                   if([self executeRequestWithId:requestId]) {
                                                                       NSMutableDictionary *userInfo = [error.userInfo mutableCopy];
                                                                       if(operation.responseObject) {
                                                                           // Add in the (parsed) response body.
                                                                           userInfo[ASPResponseObjectErrorKey] = operation.responseObject;
                                                                       }
                                                                       NSError *augmentedError = [error initWithDomain:error.domain code:error.code userInfo:userInfo];

                                                                       if([[ASPConfiguration sharedConfig] debug])
                                                                           [self logResponse:nil forRequest:request error:augmentedError];
                                                                       completionBlock(nil, augmentedError);
                                                                   }
                                                               }];

    [self.operationQueue addOperation:op];
}

- (void) downloadOperationWithCompletionBlock: (NSURLRequest *)request
                                    requestId: (NSNumber *) requestId
                              completionBlock: (void (^)(id, NSError *))completionBlock {
    AFHTTPRequestOperation *op = [self HTTPRequestOperationWithRequest:request
                                                               success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                                   
                                                                   ASPConfiguration *config = [ASPConfiguration sharedConfig];
                                                                   NSString *directory = nil;
                                                                   if (config.tempFolderPath) {
                                                                       directory = config.tempFolderPath;
                                                                   }
                                                                   else {
                                                                       directory = NSTemporaryDirectory();
                                                                   }

                                                                   NSDictionary *headers = operation.response.allHeaderFields;
                                                                   NSString *filename = nil;
                                                                   if ([headers objectForKey:@"Content-Disposition"]) {

                                                                       NSString *pattern = @"filename=['\"]?([^'\"\\s]+)['\"]?";
                                                                       NSRegularExpression *regexp = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                                                                                               options:NSRegularExpressionCaseInsensitive
                                                                                                                                                 error:nil];
                                                                       NSString *contentDispositionHeader = [headers objectForKey:@"Content-Disposition"];
                                                                       NSTextCheckingResult *match = [regexp firstMatchInString:contentDispositionHeader
                                                                                                                        options:0
                                                                                                                          range:NSMakeRange(0, [contentDispositionHeader length])];
                                                                       filename = [contentDispositionHeader substringWithRange:[match rangeAtIndex:1]];
                                                                   }
                                                                   else {
                                                                       filename = [NSString stringWithFormat:@"%@", [[NSProcessInfo processInfo] globallyUniqueString]];
                                                                   }

                                                                   NSString *filepath = [directory stringByAppendingPathComponent:filename];
                                                                   NSURL *file = [NSURL fileURLWithPath:filepath];

                                                                   [operation.responseData writeToURL:file atomically:YES];
                                                                   completionBlock(file, nil);
                                                               } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

                                                                   NSString *resStr = [[NSString alloc] initWithData:operation.responseObject
                                                                                                            encoding:NSUTF8StringEncoding];
                                                                   NSLog(@"%@", resStr);
                                                                   
                                                                   if ([self executeRequestWithId:requestId]) {
                                                                       NSMutableDictionary *userInfo = [error.userInfo mutableCopy];
                                                                       if (operation.responseObject) {
                                                                           userInfo[ASPResponseObjectErrorKey] = operation.responseObject;
                                                                       }

                                                                       NSError *augmentedError = [error initWithDomain:error.domain code:error.code userInfo:userInfo];

                                                                       if ([[ASPConfiguration sharedConfig] debug]) {
                                                                           [self logResponse:nil forRequest:request error:augmentedError];
                                                                       }

                                                                       completionBlock(nil, augmentedError);
                                                                   }
                                                               }];

    [self.operationQueue addOperation:op];
}

#pragma mark - Perform Request Methods

-(NSNumber*)  requestWithCompletionBlock: (NSString*) path
                                  method: (NSString*) method
                              pathParams: (NSDictionary *) pathParams
                             queryParams: (NSDictionary*) queryParams
                              formParams: (NSDictionary *) formParams
                                   files: (NSDictionary *) files
                                    body: (id) body
                            headerParams: (NSDictionary*) headerParams
                            authSettings: (NSArray *) authSettings
                      requestContentType: (NSString*) requestContentType
                     responseContentType: (NSString*) responseContentType
                            responseType: (NSString *) responseType
                         completionBlock: (void (^)(id, NSError *))completionBlock {
    // setting request serializer
    if ([requestContentType isEqualToString:@"application/json"]) {
        self.requestSerializer = [ASPJSONRequestSerializer serializer];
    }
    else if ([requestContentType isEqualToString:@"application/x-www-form-urlencoded"]) {
        self.requestSerializer = [AFHTTPRequestSerializer serializer];
    }
    else if ([requestContentType isEqualToString:@"multipart/form-data"]) {
        self.requestSerializer = [AFHTTPRequestSerializer serializer];
    }
    else {
        NSAssert(false, @"unsupport request type %@", requestContentType);
    }

    //By default AFNetworking, HTTPMethodsEncodingParametersInURI property encode parameters as a query string for HTTP methods `GET`, `HEAD`, and `DELETE`.
    //At-least we don't want this behaviour for DELETE HTTP method.
    self.requestSerializer.HTTPMethodsEncodingParametersInURI = [NSSet setWithArray:@[@"GET", @"HEAD"]];
    
    
    // setting response serializer
    if ([responseContentType isEqualToString:@"application/json"]) {
        self.responseSerializer = [ASPJSONResponseSerializer serializer];
        self.responseSerializer.acceptableContentTypes = [self.responseSerializer.acceptableContentTypes setByAddingObjectsFromArray:@[@"text/html"]];
    }
    else {
        self.responseSerializer = [AFHTTPResponseSerializer serializer];
    }

    // sanitize parameters
    pathParams = [self sanitizeForSerialization:pathParams];
    queryParams = [self sanitizeForSerialization:queryParams];
    headerParams = [self sanitizeForSerialization:headerParams];
    formParams = [self sanitizeForSerialization:formParams];
    body = [self sanitizeForSerialization:body];

    // auth setting
    [self updateHeaderParams:&headerParams queryParams:&queryParams WithAuthSettings:authSettings];

    NSMutableString *resourcePath = [NSMutableString stringWithString:path];
    [pathParams enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        //Replace BOOL variable having value 1 with true and 0 with false.
        if (obj == (void*)kCFBooleanTrue) {
            obj = @"true";
        } else if(obj == (void*)kCFBooleanFalse) {
            obj = @"false";
        }
        
        [resourcePath replaceCharactersInRange:[resourcePath rangeOfString:[NSString stringWithFormat:@"%@%@%@", @"{", key, @"}"]]
                                    withString:[ASPApiClient escape:obj]];
    }];

    NSMutableURLRequest * request = nil;

    NSString* pathWithQueryParams = [self pathWithQueryParamsToString:resourcePath queryParams:queryParams];
    if ([pathWithQueryParams hasPrefix:@"/"]) {
        pathWithQueryParams = [pathWithQueryParams substringFromIndex:1];
    }

    NSString* urlString = [[NSURL URLWithString:pathWithQueryParams relativeToURL:self.baseURL] absoluteString];
    urlString = [ASPApiClient sign:urlString];
    
    if (files.count == 1) {
        request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
        [request setHTTPMethod:method];
        //Track iOS SDK Usage
        [request setValue:@"iOSSDK/v1.0" forHTTPHeaderField:@"x-saaspose-client"];
        [files enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            NSURL *filePath = (NSURL *)obj;
            NSData *fileData = [NSData dataWithContentsOfURL:filePath];
            [request setValue:[self getMIMEType:filePath] forHTTPHeaderField:@"Content-Type"];
            [request setValue:[NSString stringWithFormat:@"%"NSU, [fileData length]] forHTTPHeaderField:@"Content-length"];
            [request setHTTPBody:fileData];
        }];
    } else if(files.count > 1) {
        request = [self.requestSerializer multipartFormRequestWithMethod:method
                                                               URLString:urlString
                                                              parameters:nil
                                               constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                                                   
                                                   [formParams enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                                                       NSData *data = [obj dataUsingEncoding:NSUTF8StringEncoding];
                                                       [formData appendPartWithFormData:data name:key];
                                                   }];
                                                   [files enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                                                       NSURL *filePath = (NSURL *)obj;
                                                       BOOL isSuccessfullyAppended = [formData appendPartWithFileURL:filePath name:key error:nil];
                                                       NSLog(@"%d", isSuccessfullyAppended);
                                                   }];
                                               } error:nil];
    } else {
        if (formParams) {
            request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
            [request setHTTPMethod:method];
            [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
            [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
            //Track Android SDK Usage
            [request setValue:@"iOSSDK/v1.0" forHTTPHeaderField:@"x-saaspose-client"];
        }
        if (body) {
            request = [self.requestSerializer requestWithMethod:method
                                                      URLString:urlString
                                                     parameters:body
                                                          error:nil];
        }
    }
    
    if([[request.URL absoluteString] hasSuffix:@"&"]) {
        request.URL = [NSURL URLWithString:
                       [[request.URL absoluteString] substringToIndex:[[request.URL absoluteString] length]-1]];
    }
    
    // request cache
    BOOL hasHeaderParams = false;
    if(headerParams != nil && [headerParams count] > 0) {
        hasHeaderParams = true;
    }
    if(offlineState) {
        NSLog(@"%@ cache forced", resourcePath);
        [request setCachePolicy:NSURLRequestReturnCacheDataDontLoad];
    }
    else if(!hasHeaderParams && [method isEqualToString:@"GET"] && cacheEnabled) {
        NSLog(@"%@ cache enabled", resourcePath);
        [request setCachePolicy:NSURLRequestUseProtocolCachePolicy];
    }
    else {
        NSLog(@"%@ cache disabled", resourcePath);
        [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    }
    
    if(hasHeaderParams){
        for(NSString * key in [headerParams keyEnumerator]){
            [request setValue:[headerParams valueForKey:key] forHTTPHeaderField:key];
        }
    }
    [self.requestSerializer setValue:responseContentType forHTTPHeaderField:@"Accept"];

    // Always disable cookies!
    [request setHTTPShouldHandleCookies:NO];
    
    NSNumber* requestId = [ASPApiClient queueRequest];
    if ([responseType isEqualToString:@"NSURL*"]) {
        [self downloadOperationWithCompletionBlock:request requestId:requestId completionBlock:^(id data, NSError *error) {
            completionBlock(data, error);
        }];
    }
    else {
        [self operationWithCompletionBlock:request requestId:requestId completionBlock:^(id data, NSError *error) {
            completionBlock([self deserialize:data class:responseType], error);
        }];
    }
    return requestId;
}

#pragma mark -

- (NSString*) pathWithQueryParamsToString:(NSString*) path
                              queryParams:(NSDictionary*) queryParams {
    NSString * separator = nil;
    int counter = 0;

    NSMutableString * requestUrl = [NSMutableString stringWithFormat:@"%@", path];
    if(queryParams != nil){
        for(NSString * key in [queryParams keyEnumerator]){
            if(counter == 0) separator = @"?";
            else separator = @"&";
            id queryParam = [queryParams valueForKey:key];
            if([queryParam isKindOfClass:[NSString class]]){
                [requestUrl appendString:[NSString stringWithFormat:@"%@%@=%@", separator,
                                          [ASPApiClient escape:key], [ASPApiClient escape:[queryParams valueForKey:key]]]];
            }
            else if([queryParam isKindOfClass:[ASPQueryParamCollection class]]){
                ASPQueryParamCollection * coll = (ASPQueryParamCollection*) queryParam;
                NSArray* values = [coll values];
                NSString* format = [coll format];

                if([format isEqualToString:@"csv"]) {
                    [requestUrl appendString:[NSString stringWithFormat:@"%@%@=%@", separator,
                        [ASPApiClient escape:key], [NSString stringWithFormat:@"%@", [values componentsJoinedByString:@","]]]];

                }
                else if([format isEqualToString:@"tsv"]) {
                    [requestUrl appendString:[NSString stringWithFormat:@"%@%@=%@", separator,
                        [ASPApiClient escape:key], [NSString stringWithFormat:@"%@", [values componentsJoinedByString:@"\t"]]]];

                }
                else if([format isEqualToString:@"pipes"]) {
                    [requestUrl appendString:[NSString stringWithFormat:@"%@%@=%@", separator,
                        [ASPApiClient escape:key], [NSString stringWithFormat:@"%@", [values componentsJoinedByString:@"|"]]]];

                }
                else if([format isEqualToString:@"multi"]) {
                    for(id obj in values) {
                        [requestUrl appendString:[NSString stringWithFormat:@"%@%@=%@", separator,
                            [ASPApiClient escape:key], [NSString stringWithFormat:@"%@", obj]]];
                        counter += 1;
                    }

                }
            }
            else if([queryParam isKindOfClass:[NSNumber class]] && kCFNumberCharType == CFNumberGetType((__bridge CFNumberRef)queryParam)) {
                if([(NSNumber *)[queryParams valueForKey:key] boolValue]) {
                    [requestUrl appendString:[NSString stringWithFormat:@"%@%@=%@", separator,
                                              [ASPApiClient escape:key], @"true"]];
                } else {
                    [requestUrl appendString:[NSString stringWithFormat:@"%@%@=%@", separator,
                                              [ASPApiClient escape:key], @"false"]];
                }
            } else {
                [requestUrl appendString:[NSString stringWithFormat:@"%@%@=%@", separator,
                                          [ASPApiClient escape:key], [NSString stringWithFormat:@"%@", [queryParams valueForKey:key]]]];
            }

            counter += 1;
        }
    }
    return requestUrl;
}

/**
 * Update header and query params based on authentication settings
 */
- (void) updateHeaderParams:(NSDictionary *__autoreleasing *)headers
                queryParams:(NSDictionary *__autoreleasing *)querys
           WithAuthSettings:(NSArray *)authSettings {

    if (!authSettings || [authSettings count] == 0) {
        return;
    }

    NSMutableDictionary *headersWithAuth = [NSMutableDictionary dictionaryWithDictionary:*headers];
    NSMutableDictionary *querysWithAuth = [NSMutableDictionary dictionaryWithDictionary:*querys];

    ASPConfiguration *config = [ASPConfiguration sharedConfig];
    for (NSString *auth in authSettings) {
        NSDictionary *authSetting = [[config authSettings] objectForKey:auth];

        if (authSetting) {
            if ([authSetting[@"in"] isEqualToString:@"header"]) {
                [headersWithAuth setObject:authSetting[@"value"] forKey:authSetting[@"key"]];
            }
            else if ([authSetting[@"in"] isEqualToString:@"query"]) {
                [querysWithAuth setObject:authSetting[@"value"] forKey:authSetting[@"key"]];
            }
        }
    }

    *headers = [NSDictionary dictionaryWithDictionary:headersWithAuth];
    *querys = [NSDictionary dictionaryWithDictionary:querysWithAuth];
}

- (id) sanitizeForSerialization:(id) object {
    if (object == nil) {
        return nil;
    }
    else if ([object isKindOfClass:[NSString class]] || [object isKindOfClass:[NSNumber class]] || [object isKindOfClass:[ASPQueryParamCollection class]]) {
        return object;
    }
    else if ([object isKindOfClass:[NSDate class]]) {
        return [object ISO8601String];
    }
    else if ([object isKindOfClass:[NSArray class]]) {
        NSMutableArray *sanitizedObjs = [NSMutableArray arrayWithCapacity:[object count]];
        [object enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if (obj) {
                [sanitizedObjs addObject:[self sanitizeForSerialization:obj]];
            }
        }];
        return sanitizedObjs;
    }
    else if ([object isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *sanitizedObjs = [NSMutableDictionary dictionaryWithCapacity:[object count]];
        [object enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            if (obj) {
                [sanitizedObjs setValue:[self sanitizeForSerialization:obj] forKey:key];
            }
        }];
        return sanitizedObjs;
    }
    else if ([object isKindOfClass:[ASPObject class]]) {
        return [object toDictionary];
    }
    else {
        NSException *e = [NSException
                          exceptionWithName:@"InvalidObjectArgumentException"
                          reason:[NSString stringWithFormat:@"*** The argument object: %@ is invalid", object]
                          userInfo:nil];
        @throw e;
    }
}

#pragma mark - Sign
+ (NSString *) sign:(NSString *) unsignedURL {
    
    NSParameterAssert(unsignedURL);
    
    NSMutableString *mUnsignedURL = [NSMutableString stringWithString:unsignedURL];
    
    //Remove any trailing '/' character
    if([mUnsignedURL hasSuffix:@"/"]) {
        [mUnsignedURL deleteCharactersInRange:NSMakeRange([mUnsignedURL length] -1, 1)];
    }
    
    if ([mUnsignedURL rangeOfString:@"?"].location == NSNotFound) {
        [mUnsignedURL appendString:@"?"];
    } else {
        [mUnsignedURL appendString:@"&"];
    }
    
    //Add appSID parameter to the query string
    [mUnsignedURL appendFormat:@"appSID=%@", appSID];
    
    //Calculate a hash of the current url
    const char *cKey  = [appKey cStringUsingEncoding:NSUTF8StringEncoding];
    const char *cData = [mUnsignedURL cStringUsingEncoding:NSUTF8StringEncoding];
    unsigned char cHMAC[CC_SHA1_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    NSData *HMACData = [[NSData alloc] initWithBytes:cHMAC length:sizeof(cHMAC)];
    NSString *hash = [HMACData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    //Remove any trailing '=' characters
    if([hash hasSuffix:@"="]) {
        hash = [hash substringToIndex:[hash length]-1];
    }
    
    //URL-encode generated string
    hash = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)hash, NULL,
                                                                                 (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8));
    
    //Add the encoded value to the current url as a signature parameter
    [mUnsignedURL appendFormat:@"&signature=%@", hash];
    return mUnsignedURL;
}

- (NSString *)getMIMEType:(NSURL *) fileURL {
    NSString *fileExtension = [fileURL pathExtension];
    NSString *UTI = (__bridge_transfer NSString *)UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge CFStringRef)fileExtension, NULL);
    NSString *contentType = (__bridge_transfer NSString *)UTTypeCopyPreferredTagWithClass((__bridge CFStringRef)UTI, kUTTagClassMIMEType);
    return contentType;
}

@end
