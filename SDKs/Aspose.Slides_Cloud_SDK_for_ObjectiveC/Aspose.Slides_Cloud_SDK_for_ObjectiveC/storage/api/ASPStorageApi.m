#import "ASPStorageApi.h"
#import "ASPQueryParamCollection.h"
#import "ASPDiscUsageResponse.h"
#import "ASPFileExistResponse.h"
#import "ASPBaseResponse.h"
#import "ASPFolderResponse.h"
#import "ASPFileVersionsResponse.h"
#import "ASPStorageExistResponse.h"


@interface ASPStorageApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation ASPStorageApi

#pragma mark - Initialize methods

- (id) init {
    self = [super init];
    if (self) {
        ASPConfiguration *config = [ASPConfiguration sharedConfig];
        if (config.apiClient == nil) {
            config.apiClient = [[ASPApiClient alloc] init];
        }
        self.apiClient = config.apiClient;
        self.defaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

- (id) initWithApiClient:(ASPApiClient *)apiClient {
    self = [super init];
    if (self) {
        self.apiClient = apiClient;
        self.defaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

#pragma mark -

+(ASPStorageApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {
    static ASPStorageApi* singletonAPI = nil;

    if (singletonAPI == nil) {
        singletonAPI = [[ASPStorageApi alloc] init];
        [singletonAPI addHeader:headerValue forKey:key];
    }
    return singletonAPI;
}

-(void) addHeader:(NSString*)value forKey:(NSString*)key {
    [self.defaultHeaders setValue:value forKey:key];
}

-(void) setHeaderValue:(NSString*) value
           forKey:(NSString*)key {
    [self.defaultHeaders setValue:value forKey:key];
}

-(unsigned long) requestQueueSize {
    return [ASPApiClient requestQueueSize];
}

#pragma mark - Api Methods

///
/// Check the disk usage of the current account. Parameters: storage - user's storage name.
/// 
///  @param storage 
///
///  @returns ASPDiscUsageResponse*
///
-(NSNumber*) getDiscUsageWithCompletionBlock: (NSString*) storage
        
        completionHandler: (void (^)(ASPDiscUsageResponse* output, NSError* error))completionBlock { 
        

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/storage/disc"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [ASPApiClient selectHeaderAccept:@[@"application/json", @"text/json", @"application/xml", @"text/xml", @"text/javascript"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [ASPApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"ASPDiscUsageResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPDiscUsageResponse*)data, error);
              }
          ];
}

///
/// Check if a specific file or folder exists. Parameters: path - file or folder path e.g. /file.ext or /Folder1, versionID - file's version, storage - user's storage name.
/// 
///  @param path 
///
///  @param versionId 
///
///  @param storage 
///
///  @returns ASPFileExistResponse*
///
-(NSNumber*) getIsExistWithCompletionBlock: (NSString*) path
         versionId: (NSString*) versionId
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPFileExistResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'path' is set
    if (path == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `path` when calling `getIsExist`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/storage/exist/{path}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (path != nil) {
        pathParams[@"path"] = path;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(versionId != nil) {
        
        queryParams[@"versionId"] = versionId;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [ASPApiClient selectHeaderAccept:@[@"application/json", @"text/json", @"application/xml", @"text/xml", @"text/javascript"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [ASPApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"ASPFileExistResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPFileExistResponse*)data, error);
              }
          ];
}

///
/// Download a specific file. Parameters: path - file path e.g. /file.ext, versionID - file's version, storage - user's storage name.
/// 
///  @param path 
///
///  @param versionId 
///
///  @param storage 
///
///  @returns NSURL*
///
-(NSNumber*) getDownloadWithCompletionBlock: (NSString*) path
         versionId: (NSString*) versionId
         storage: (NSString*) storage
        
        completionHandler: (void (^)(NSURL* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'path' is set
    if (path == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `path` when calling `getDownload`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/storage/file/{path}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (path != nil) {
        pathParams[@"path"] = path;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(versionId != nil) {
        
        queryParams[@"versionId"] = versionId;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [ASPApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [ASPApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"NSURL*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((NSURL*)data, error);
              }
          ];
}

///
/// Upload a specific file. Parameters: path - source file path e.g. /file.ext, versionID - source file's version, storage - user's source storage name, newdest - destination file path, destStorage - user's destination storage name.
///
///  @param path
///
///  @param file file to upload
///
///  @param versionId
///
///  @param storage
///
///  @returns ASPBaseResponse*
///
-(NSNumber*) putCreateWithCompletionBlock: (NSString*) path
                                     file: (NSURL*) file
                                versionId: (NSString*) versionId
                                  storage: (NSString*) storage

                        completionHandler: (void (^)(ASPBaseResponse* output, NSError* error))completionBlock {
    
    
    
    // verify the required parameter 'path' is set
    if (path == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `path` when calling `putCreate`"];
    }
    
    // verify the required parameter 'file' is set
    if (file == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `file` when calling `putCreate`"];
    }
    
    
    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/storage/file/{path}"];
    
    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }
    
    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (path != nil) {
        pathParams[@"path"] = path;
    }
    
    
    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(versionId != nil) {
        
        queryParams[@"versionId"] = versionId;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];
    
    
    
    // HTTP header `Accept`
    headerParams[@"Accept"] = [ASPApiClient selectHeaderAccept:@[@"application/json", @"text/json", @"text/javascript"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }
    
    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }
    
    // request content type
    NSString *requestContentType = [ASPApiClient selectHeaderContentType:@[]];
    
    // Authentication setting
    NSArray *authSettings = @[];
    
    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    
    files[@"file"] = file;
    
    
    
    
    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"PUT"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"ASPBaseResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                                          completionBlock((ASPBaseResponse*)data, error);
                                      }
            ];
}

///
/// Copy a specific file. Parameters: path - source file path e.g. /file.ext, versionID - source file's version, storage - user's source storage name, newdest - destination file path, destStorage - user's destination storage name.
/// 
///  @param path 
///
///  @param newdest 
///
///  @param versionId 
///
///  @param storage 
///
///  @param destStorage 
///
///  @param file 
///
///  @returns ASPBaseResponse*
///
-(NSNumber*) putCopyWithCompletionBlock: (NSString*) path
         newdest: (NSString*) newdest
         versionId: (NSString*) versionId
         storage: (NSString*) storage
         destStorage: (NSString*) destStorage
         file: (NSURL*) file
        
        completionHandler: (void (^)(ASPBaseResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'path' is set
    if (path == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `path` when calling `putCopy`"];
    }
    
    // verify the required parameter 'newdest' is set
    if (newdest == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `newdest` when calling `putCopy`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/storage/file/{path}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (path != nil) {
        pathParams[@"path"] = path;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(newdest != nil) {
        
        queryParams[@"newdest"] = newdest;
    }
    if(versionId != nil) {
        
        queryParams[@"versionId"] = versionId;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
    }
    if(destStorage != nil) {
        
        queryParams[@"destStorage"] = destStorage;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [ASPApiClient selectHeaderAccept:@[@"application/json", @"text/json", @"text/javascript"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [ASPApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    
    files[@"file"] = file;
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"PUT"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"ASPBaseResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPBaseResponse*)data, error);
              }
          ];
}

///
/// Remove a specific file. Parameters: path - file path e.g. /file.ext, versionID - file's version, storage - user's storage name.
/// 
///  @param path 
///
///  @param versionId 
///
///  @param storage 
///
///  @returns ASPBaseResponse*
///
-(NSNumber*) deleteFileWithCompletionBlock: (NSString*) path
         versionId: (NSString*) versionId
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPBaseResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'path' is set
    if (path == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `path` when calling `deleteFile`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/storage/file/{path}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (path != nil) {
        pathParams[@"path"] = path;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(versionId != nil) {
        
        queryParams[@"versionId"] = versionId;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [ASPApiClient selectHeaderAccept:@[@"application/json", @"text/json", @"application/xml", @"text/xml", @"text/javascript"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [ASPApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"DELETE"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"ASPBaseResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPBaseResponse*)data, error);
              }
          ];
}

///
/// Move a specific file.
/// 
///  @param src source file path e.g. /file.ext
///
///  @param dest 
///
///  @param versionId source file's version,
///
///  @param storage user's source storage name
///
///  @param destStorage user's destination storage name
///
///  @returns ASPBaseResponse*
///
-(NSNumber*) postMoveFileWithCompletionBlock: (NSString*) src
         dest: (NSString*) dest
         versionId: (NSString*) versionId
         storage: (NSString*) storage
         destStorage: (NSString*) destStorage
        
        completionHandler: (void (^)(ASPBaseResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'src' is set
    if (src == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `src` when calling `postMoveFile`"];
    }
    
    // verify the required parameter 'dest' is set
    if (dest == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `dest` when calling `postMoveFile`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/storage/file/{src}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (src != nil) {
        pathParams[@"src"] = src;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(dest != nil) {
        
        queryParams[@"dest"] = dest;
    }
    if(versionId != nil) {
        
        queryParams[@"versionId"] = versionId;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
    }
    if(destStorage != nil) {
        
        queryParams[@"destStorage"] = destStorage;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [ASPApiClient selectHeaderAccept:@[@"application/json", @"text/json", @"application/xml", @"text/xml", @"text/javascript"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [ASPApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"POST"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"ASPBaseResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPBaseResponse*)data, error);
              }
          ];
}

///
/// Get the file listing of a specific folder. Parametres: path - start with name of storage e.g. root folder '/'or some folder '/folder1/..', storage - user's storage name.
/// 
///  @param path 
///
///  @param storage 
///
///  @returns ASPFolderResponse*
///
-(NSNumber*) getListFilesWithCompletionBlock: (NSString*) path
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPFolderResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'path' is set
    if (path == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `path` when calling `getListFiles`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/storage/folder/{path}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (path != nil) {
        pathParams[@"path"] = path;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [ASPApiClient selectHeaderAccept:@[@"application/json", @"text/json", @"text/javascript"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [ASPApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"ASPFolderResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPFolderResponse*)data, error);
              }
          ];
}

///
/// Create the folder. Parameters: path - source folder path e.g. /Folder1, storage - user's source storage name, newdest - destination folder path e.g. /Folder2, destStorage - user's destination storage name.
///
///  @param path
///
///  @param storage
///
///  @param destStorage
///
///  @returns ASPBaseResponse*
///
-(NSNumber*) putCreateFolderWithCompletionBlock: (NSString*) path
                                        storage: (NSString*) storage
                                    destStorage: (NSString*) destStorage

                              completionHandler: (void (^)(ASPBaseResponse* output, NSError* error))completionBlock {
    
    
    
    // verify the required parameter 'path' is set
    if (path == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `path` when calling `putCreateFolder`"];
    }
    
    
    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/storage/folder/{path}"];
    
    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }
    
    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (path != nil) {
        pathParams[@"path"] = path;
    }
    
    
    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
    }
    if(destStorage != nil) {
        
        queryParams[@"destStorage"] = destStorage;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];
    
    
    
    // HTTP header `Accept`
    headerParams[@"Accept"] = [ASPApiClient selectHeaderAccept:@[@"application/json", @"text/json", @"text/javascript"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }
    
    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }
    
    // request content type
    NSString *requestContentType = [ASPApiClient selectHeaderContentType:@[]];
    
    // Authentication setting
    NSArray *authSettings = @[];
    
    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    
    
    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"PUT"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"ASPBaseResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                                          
                                          completionBlock((ASPBaseResponse*)data, error);
                                      }
            ];
}

///
/// Copy a folder. Parameters: path - source folder path e.g. /Folder1, storage - user's source storage name, newdest - destination folder path e.g. /Folder2, destStorage - user's destination storage name.
/// 
///  @param path 
///
///  @param newdest 
///
///  @param storage 
///
///  @param destStorage 
///
///  @returns ASPBaseResponse*
///
-(NSNumber*) putCopyFolderWithCompletionBlock: (NSString*) path
         newdest: (NSString*) newdest
         storage: (NSString*) storage
         destStorage: (NSString*) destStorage
        
        completionHandler: (void (^)(ASPBaseResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'path' is set
    if (path == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `path` when calling `putCopyFolder`"];
    }
    
    // verify the required parameter 'newdest' is set
    if (newdest == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `newdest` when calling `putCopyFolder`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/storage/folder/{path}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (path != nil) {
        pathParams[@"path"] = path;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(newdest != nil) {
        
        queryParams[@"newdest"] = newdest;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
    }
    if(destStorage != nil) {
        
        queryParams[@"destStorage"] = destStorage;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [ASPApiClient selectHeaderAccept:@[@"application/json"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [ASPApiClient selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"PUT"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"ASPBaseResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPBaseResponse*)data, error);
              }
          ];
}

///
/// Remove a specific folder. Parameters: path - folder path e.g. /Folder1, storage - user's storage name, recursive - is subfolders and files must be deleted for specified path.
/// 
///  @param path 
///
///  @param storage 
///
///  @param recursive 
///
///  @returns ASPBaseResponse*
///
-(NSNumber*) deleteFolderWithCompletionBlock: (NSString*) path
         storage: (NSString*) storage
         recursive: (NSNumber*) recursive
        
        completionHandler: (void (^)(ASPBaseResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'path' is set
    if (path == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `path` when calling `deleteFolder`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/storage/folder/{path}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (path != nil) {
        pathParams[@"path"] = path;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
    }
    if(recursive != nil) {
        
        queryParams[@"recursive"] = recursive;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [ASPApiClient selectHeaderAccept:@[@"application/json", @"text/json", @"application/xml", @"text/xml", @"text/javascript"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [ASPApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"DELETE"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"ASPBaseResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPBaseResponse*)data, error);
              }
          ];
}

///
/// Move a specific folder. Parameters: src - source folder path e.g. /Folder1, storage - user's source storage name, dest - destination folder path e.g. /Folder2, destStorage - user's destination storage name.
/// 
///  @param src 
///
///  @param dest 
///
///  @param storage 
///
///  @param destStorage 
///
///  @returns ASPBaseResponse*
///
-(NSNumber*) postMoveFolderWithCompletionBlock: (NSString*) src
         dest: (NSString*) dest
         storage: (NSString*) storage
         destStorage: (NSString*) destStorage
        
        completionHandler: (void (^)(ASPBaseResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'src' is set
    if (src == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `src` when calling `postMoveFolder`"];
    }
    
    // verify the required parameter 'dest' is set
    if (dest == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `dest` when calling `postMoveFolder`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/storage/folder/{src}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (src != nil) {
        pathParams[@"src"] = src;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(dest != nil) {
        
        queryParams[@"dest"] = dest;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
    }
    if(destStorage != nil) {
        
        queryParams[@"destStorage"] = destStorage;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [ASPApiClient selectHeaderAccept:@[@"application/json", @"text/json", @"application/xml", @"text/xml", @"text/javascript"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [ASPApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"POST"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"ASPBaseResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPBaseResponse*)data, error);
              }
          ];
}

///
/// Get the file's versions list. Parameters: path - file path e.g. /file.ext or /Folder1/file.ext, storage - user's storage name.
/// 
///  @param path 
///
///  @param storage 
///
///  @returns ASPFileVersionsResponse*
///
-(NSNumber*) getListFileVersionsWithCompletionBlock: (NSString*) path
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPFileVersionsResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'path' is set
    if (path == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `path` when calling `getListFileVersions`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/storage/version/{path}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (path != nil) {
        pathParams[@"path"] = path;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [ASPApiClient selectHeaderAccept:@[@"application/json", @"text/json", @"application/xml", @"text/xml", @"text/javascript"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [ASPApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"ASPFileVersionsResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPFileVersionsResponse*)data, error);
              }
          ];
}

///
/// Check if a specific storage exists.
/// 
///  @param name Storage name
///
///  @returns ASPStorageExistResponse*
///
-(NSNumber*) getIsStorageExistWithCompletionBlock: (NSString*) name
        
        completionHandler: (void (^)(ASPStorageExistResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `getIsStorageExist`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/storage/{name}/exist"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [ASPApiClient selectHeaderAccept:@[@"application/json", @"text/json", @"application/xml", @"text/xml", @"text/javascript"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [ASPApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithCompletionBlock: resourcePath
                                               method: @"GET"
                                           pathParams: pathParams
                                          queryParams: queryParams
                                           formParams: formParams
                                                files: files
                                                 body: bodyParam
                                         headerParams: headerParams
                                         authSettings: authSettings
                                   requestContentType: requestContentType
                                  responseContentType: responseContentType
                                         responseType: @"ASPStorageExistResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPStorageExistResponse*)data, error);
              }
          ];
}



@end
