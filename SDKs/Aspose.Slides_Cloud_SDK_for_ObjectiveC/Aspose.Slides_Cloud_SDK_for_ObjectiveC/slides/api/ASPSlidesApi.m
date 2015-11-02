#import "ASPSlidesApi.h"
#import "ASPQueryParamCollection.h"
#import "ASPBaseResponse.h"
#import "ASPDocumentPropertiesResponse.h"
#import "ASPDocumentProperties.h"
#import "ASPDocumentPropertyResponse.h"
#import "ASPDocumentProperty.h"
#import "ASPCommonResponse.h"
#import "ASPImagesResponse.h"
#import "ASPOrderedMergeRequest.h"
#import "ASPDocumentResponse.h"
#import "ASPPresentationsMergeRequest.h"
#import "ASPPresentationStringReplaceResponse.h"
#import "ASPHtmlExportOptions.h"
#import "ASPPdfExportOptions.h"
#import "ASPTiffExportOptions.h"
#import "ASPSlideListResponse.h"
#import "ASPSlideBackgroundResponse.h"
#import "ASPSlideCommentsResponse.h"
#import "ASPPlaceholdersResponse.h"
#import "ASPPlaceholderResponse.h"
#import "ASPSlideStringReplaceResponse.h"
#import "ASPShape.h"
#import "ASPPortion.h"
#import "ASPTextItemsResponse.h"
#import "ASPThemeResponse.h"
#import "ASPColorSchemeResponse.h"
#import "ASPFontSchemeResponse.h"
#import "ASPFormatSchemeResponse.h"
#import "ASPSplitDocumentResponse.h"


@interface ASPSlidesApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation ASPSlidesApi

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

+(ASPSlidesApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {
    static ASPSlidesApi* singletonAPI = nil;

    if (singletonAPI == nil) {
        singletonAPI = [[ASPSlidesApi alloc] init];
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
/// Convert presentation from request content to format specified.
/// 
///  @param file 
///
///  @param password The document password.
///
///  @param format The format.
///
///  @param outPath Path to save result
///
///  @returns NSURL*
///
-(NSNumber*) putSlidesConvertWithCompletionBlock: (NSURL*) file
         password: (NSString*) password
         format: (NSString*) format
         outPath: (NSString*) outPath
        
        completionHandler: (void (^)(NSURL* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'file' is set
    if (file == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `file` when calling `putSlidesConvert`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/convert"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(password != nil) {
        
        queryParams[@"password"] = password;
    }
    if(format != nil) {
        
        queryParams[@"format"] = format;
    }
    if(outPath != nil) {
        
        queryParams[@"outPath"] = outPath;
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
    NSString *requestContentType = [ASPApiClient selectHeaderContentType:@[@"multipart/form-data"]];

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
                                         responseType: @"NSURL*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((NSURL*)data, error);
              }
          ];
}

///
/// Read presentation info.
/// 
///  @param name The document name.
///
///  @param password The document password.
///
///  @param storage Document's storage.
///
///  @param folder Document's folder.
///
///  @returns ASPBaseResponse*
///
-(NSNumber*) getSlidesDocumentWithCompletionBlock: (NSString*) name
         password: (NSString*) password
         storage: (NSString*) storage
         folder: (NSString*) folder
        
        completionHandler: (void (^)(ASPBaseResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `getSlidesDocument`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(password != nil) {
        
        queryParams[@"password"] = password;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
    }
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
                                         responseType: @"ASPBaseResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPBaseResponse*)data, error);
              }
          ];
}

///
/// Create presentation
/// 
///  @param name The document name.
///
///  @param file 
///
///  @param password The document password.
///
///  @param storage Document's storage.
///
///  @param folder Document's folder.
///
///  @returns ASPBaseResponse*
///
-(NSNumber*) putNewPresentationWithCompletionBlock: (NSString*) name
         file: (NSURL*) file
         password: (NSString*) password
         storage: (NSString*) storage
         folder: (NSString*) folder
        
        completionHandler: (void (^)(ASPBaseResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `putNewPresentation`"];
    }
    
    // verify the required parameter 'file' is set
    if (file == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `file` when calling `putNewPresentation`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(password != nil) {
        
        queryParams[@"password"] = password;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
    }
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
    NSString *requestContentType = [ASPApiClient selectHeaderContentType:@[@"multipart/form-data"]];

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
/// Create presentation
/// 
///  @param name The document name.
///
///  @param templatePath Template file path.
///
///  @param file 
///
///  @param templateStorage Template storage name.
///
///  @param isImageDataEmbeeded Is Image Data Embeeded
///
///  @param password The document password.
///
///  @param storage Document's storage.
///
///  @param folder Document's folder.
///
///  @returns ASPBaseResponse*
///
-(NSNumber*) postSlidesDocumentWithCompletionBlock: (NSString*) name
         templatePath: (NSString*) templatePath
         file: (NSURL*) file
         templateStorage: (NSString*) templateStorage
         isImageDataEmbeeded: (NSNumber*) isImageDataEmbeeded
         password: (NSString*) password
         storage: (NSString*) storage
         folder: (NSString*) folder
        
        completionHandler: (void (^)(ASPBaseResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `postSlidesDocument`"];
    }
    
    // verify the required parameter 'templatePath' is set
    if (templatePath == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `templatePath` when calling `postSlidesDocument`"];
    }
    
    // verify the required parameter 'file' is set
    if (file == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `file` when calling `postSlidesDocument`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(templatePath != nil) {
        
        queryParams[@"templatePath"] = templatePath;
    }
    if(templateStorage != nil) {
        
        queryParams[@"templateStorage"] = templateStorage;
    }
    if(isImageDataEmbeeded != nil) {
        
        queryParams[@"isImageDataEmbeeded"] = isImageDataEmbeeded;
    }
    if(password != nil) {
        
        queryParams[@"password"] = password;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
    }
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
    NSString *requestContentType = [ASPApiClient selectHeaderContentType:@[@"multipart/form-data"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    
    
    files[@"file"] = file;
    
    
    

    
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
/// Read presentation document properties.
/// 
///  @param name The document name.
///
///  @param folder Document's folder.
///
///  @param storage Document's storage.
///
///  @returns ASPDocumentPropertiesResponse*
///
-(NSNumber*) getSlidesDocumentPropertiesWithCompletionBlock: (NSString*) name
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPDocumentPropertiesResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `getSlidesDocumentProperties`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/documentproperties"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
                                         responseType: @"ASPDocumentPropertiesResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPDocumentPropertiesResponse*)data, error);
              }
          ];
}

///
/// Set document properties.
/// 
///  @param name The document name.
///
///  @param properties New properties.
///
///  @param folder Document's folder.
///
///  @param storage Document's storage.
///
///  @returns ASPDocumentPropertiesResponse*
///
-(NSNumber*) postSlidesSetDocumentPropertiesWithCompletionBlock: (NSString*) name
         properties: (ASPDocumentProperties*) properties
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPDocumentPropertiesResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `postSlidesSetDocumentProperties`"];
    }
    
    // verify the required parameter 'properties' is set
    if (properties == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `properties` when calling `postSlidesSetDocumentProperties`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/documentproperties"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
    NSString *requestContentType = [ASPApiClient selectHeaderContentType:@[@"application/json", @"text/json", @"application/xml", @"text/xml", @"text/javascript", @"application/x-www-form-urlencoded"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    bodyParam = properties;
    

    
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
                                         responseType: @"ASPDocumentPropertiesResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPDocumentPropertiesResponse*)data, error);
              }
          ];
}

///
/// Clean document properties.
/// 
///  @param name The presentation name.
///
///  @param folder The presentation folder.
///
///  @param storage Document's storage.
///
///  @returns ASPDocumentPropertiesResponse*
///
-(NSNumber*) deleteSlidesDocumentPropertiesWithCompletionBlock: (NSString*) name
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPDocumentPropertiesResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `deleteSlidesDocumentProperties`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/documentproperties"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
                                         responseType: @"ASPDocumentPropertiesResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPDocumentPropertiesResponse*)data, error);
              }
          ];
}

///
/// Read presentation document property.
/// 
///  @param name The document name.
///
///  @param propertyName The property name.
///
///  @param folder Document's folder.
///
///  @param storage Document's storage.
///
///  @returns ASPDocumentPropertyResponse*
///
-(NSNumber*) getSlidesDocumentPropertyWithCompletionBlock: (NSString*) name
         propertyName: (NSString*) propertyName
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPDocumentPropertyResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `getSlidesDocumentProperty`"];
    }
    
    // verify the required parameter 'propertyName' is set
    if (propertyName == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `propertyName` when calling `getSlidesDocumentProperty`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/documentproperties/{propertyName}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    if (propertyName != nil) {
        pathParams[@"propertyName"] = propertyName;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
                                         responseType: @"ASPDocumentPropertyResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPDocumentPropertyResponse*)data, error);
              }
          ];
}

///
/// Set document property.
/// 
///  @param name The presentation name.
///
///  @param propertyName The property name.
///
///  @param _property Property with the value.
///
///  @param folder Document's folder.
///
///  @param storage Document's storage.
///
///  @returns ASPDocumentPropertyResponse*
///
-(NSNumber*) putSlidesSetDocumentPropertyWithCompletionBlock: (NSString*) name
         propertyName: (NSString*) propertyName
         _property: (ASPDocumentProperty*) _property
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPDocumentPropertyResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `putSlidesSetDocumentProperty`"];
    }
    
    // verify the required parameter 'propertyName' is set
    if (propertyName == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `propertyName` when calling `putSlidesSetDocumentProperty`"];
    }
    
    // verify the required parameter '_property' is set
    if (_property == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `_property` when calling `putSlidesSetDocumentProperty`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/documentproperties/{propertyName}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    if (propertyName != nil) {
        pathParams[@"propertyName"] = propertyName;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
    NSString *requestContentType = [ASPApiClient selectHeaderContentType:@[@"application/json", @"text/json", @"application/xml", @"text/xml", @"text/javascript", @"application/x-www-form-urlencoded"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    bodyParam = _property;
    

    
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
                                         responseType: @"ASPDocumentPropertyResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPDocumentPropertyResponse*)data, error);
              }
          ];
}

///
/// Delete document property.
/// 
///  @param name The presentation name.
///
///  @param propertyName The property name.
///
///  @param folder The presentation folder.
///
///  @param storage Document's storage.
///
///  @returns ASPCommonResponse*
///
-(NSNumber*) deleteSlidesDocumentPropertyWithCompletionBlock: (NSString*) name
         propertyName: (NSString*) propertyName
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPCommonResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `deleteSlidesDocumentProperty`"];
    }
    
    // verify the required parameter 'propertyName' is set
    if (propertyName == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `propertyName` when calling `deleteSlidesDocumentProperty`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/documentproperties/{propertyName}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    if (propertyName != nil) {
        pathParams[@"propertyName"] = propertyName;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
                                         responseType: @"ASPCommonResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPCommonResponse*)data, error);
              }
          ];
}

///
/// Create presentation document from html
/// 
///  @param name The document name.
///
///  @param file 
///
///  @param password The document password.
///
///  @param storage Document's storage.
///
///  @param folder Document's folder.
///
///  @returns ASPBaseResponse*
///
-(NSNumber*) putSlidesDocumentFromHtmlWithCompletionBlock: (NSString*) name
         file: (NSURL*) file
         password: (NSString*) password
         storage: (NSString*) storage
         folder: (NSString*) folder
        
        completionHandler: (void (^)(ASPBaseResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `putSlidesDocumentFromHtml`"];
    }
    
    // verify the required parameter 'file' is set
    if (file == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `file` when calling `putSlidesDocumentFromHtml`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/fromHtml"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(password != nil) {
        
        queryParams[@"password"] = password;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
    }
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
/// Read presentation images info.
/// 
///  @param name The presentation name.
///
///  @param folder The presentation folder.
///
///  @param storage Document's storage.
///
///  @returns ASPImagesResponse*
///
-(NSNumber*) getSlidesImagesWithCompletionBlock: (NSString*) name
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPImagesResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `getSlidesImages`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/images"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
                                         responseType: @"ASPImagesResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPImagesResponse*)data, error);
              }
          ];
}

///
/// Merge presentations.
/// 
///  @param name Original presentation name.
///
///  @param request {PresentationsMergeRequest} with a list of presentations to merge.
///
///  @param storage The storage.
///
///  @param folder The folder.
///
///  @returns ASPDocumentResponse*
///
-(NSNumber*) putPresentationMergeWithCompletionBlock: (NSString*) name
         request: (ASPOrderedMergeRequest*) request
         storage: (NSString*) storage
         folder: (NSString*) folder
        
        completionHandler: (void (^)(ASPDocumentResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `putPresentationMerge`"];
    }
    
    // verify the required parameter 'request' is set
    if (request == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `request` when calling `putPresentationMerge`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/merge"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
    }
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
    NSString *requestContentType = [ASPApiClient selectHeaderContentType:@[@"application/json", @"text/json", @"application/xml", @"text/xml", @"text/javascript", @"application/x-www-form-urlencoded"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    bodyParam = request;
    

    
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
                                         responseType: @"ASPDocumentResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPDocumentResponse*)data, error);
              }
          ];
}

///
/// Merge presentations.
/// 
///  @param name Original presentation name.
///
///  @param request {PresentationsMergeRequest} with a list of presentations to merge.
///
///  @param storage The storage.
///
///  @param folder The folder.
///
///  @returns ASPDocumentResponse*
///
-(NSNumber*) postPresentationMergeWithCompletionBlock: (NSString*) name
         request: (ASPPresentationsMergeRequest*) request
         storage: (NSString*) storage
         folder: (NSString*) folder
        
        completionHandler: (void (^)(ASPDocumentResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `postPresentationMerge`"];
    }
    
    // verify the required parameter 'request' is set
    if (request == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `request` when calling `postPresentationMerge`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/merge"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
    }
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
    NSString *requestContentType = [ASPApiClient selectHeaderContentType:@[@"application/json", @"text/json", @"application/xml", @"text/xml", @"text/javascript", @"application/x-www-form-urlencoded"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    bodyParam = request;
    

    
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
                                         responseType: @"ASPDocumentResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPDocumentResponse*)data, error);
              }
          ];
}

///
/// Replace text by a new value.
/// 
///  @param name The presentation name.
///
///  @param oldValue Text value to replace.
///
///  @param newValue The new text value.
///
///  @param ignoreCase Is case must be ignored.
///
///  @param folder The presentation folder.
///
///  @param storage Presentation storage.
///
///  @returns ASPPresentationStringReplaceResponse*
///
-(NSNumber*) postSlidesPresentationReplaceTextWithCompletionBlock: (NSString*) name
         oldValue: (NSString*) oldValue
         newValue: (NSString*) newValue
         ignoreCase: (NSNumber*) ignoreCase
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPPresentationStringReplaceResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `postSlidesPresentationReplaceText`"];
    }
    
    // verify the required parameter 'oldValue' is set
    if (oldValue == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `oldValue` when calling `postSlidesPresentationReplaceText`"];
    }
    
    // verify the required parameter 'newValue' is set
    if (newValue == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `newValue` when calling `postSlidesPresentationReplaceText`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/replaceText"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(oldValue != nil) {
        
        queryParams[@"oldValue"] = oldValue;
    }
    if(newValue != nil) {
        
        queryParams[@"newValue"] = newValue;
    }
    if(ignoreCase != nil) {
        
        queryParams[@"ignoreCase"] = ignoreCase;
    }
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
                                         responseType: @"ASPPresentationStringReplaceResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPPresentationStringReplaceResponse*)data, error);
              }
          ];
}

///
/// Saves presentation in html format with options
/// 
///  @param name The presentation name
///
///  @param options Tiff export options
///
///  @param password The password to open presentation.
///
///  @param storage Document's storage.
///
///  @param folder The presentation folder.
///
///  @param outPath The optional output path.
///
///  @returns ASPBaseResponse*
///
-(NSNumber*) postSlidesSaveAsHtmlWithCompletionBlock: (NSString*) name
         options: (ASPHtmlExportOptions*) options
         password: (NSString*) password
         storage: (NSString*) storage
         folder: (NSString*) folder
         outPath: (NSString*) outPath
        
        completionHandler: (void (^)(ASPBaseResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `postSlidesSaveAsHtml`"];
    }
    
    // verify the required parameter 'options' is set
    if (options == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `options` when calling `postSlidesSaveAsHtml`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/saveAs/html"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(password != nil) {
        
        queryParams[@"password"] = password;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
    }
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
    }
    if(outPath != nil) {
        
        queryParams[@"outPath"] = outPath;
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
    NSString *requestContentType = [ASPApiClient selectHeaderContentType:@[@"application/json", @"text/json", @"application/xml", @"text/xml", @"text/javascript", @"application/x-www-form-urlencoded"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    bodyParam = options;
    

    
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
/// Saves presentation in pdf format with options
/// 
///  @param name The presentation name
///
///  @param options Pdf export options
///
///  @param password The password to open presentation.
///
///  @param storage Document's storage.
///
///  @param folder The presentation folder.
///
///  @param outPath The optional output path.
///
///  @returns ASPBaseResponse*
///
-(NSNumber*) postSlidesSaveAsPdfWithCompletionBlock: (NSString*) name
         options: (ASPPdfExportOptions*) options
         password: (NSString*) password
         storage: (NSString*) storage
         folder: (NSString*) folder
         outPath: (NSString*) outPath
        
        completionHandler: (void (^)(ASPBaseResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `postSlidesSaveAsPdf`"];
    }
    
    // verify the required parameter 'options' is set
    if (options == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `options` when calling `postSlidesSaveAsPdf`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/saveAs/pdf"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(password != nil) {
        
        queryParams[@"password"] = password;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
    }
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
    }
    if(outPath != nil) {
        
        queryParams[@"outPath"] = outPath;
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
    
    bodyParam = options;
    

    
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
/// Saves presentation in tiff format with options
/// 
///  @param name The presentation name
///
///  @param options Tiff export options
///
///  @param password The password to open presentation.
///
///  @param storage Document's storage.
///
///  @param folder The presentation folder.
///
///  @param outPath The optional output path.
///
///  @returns ASPBaseResponse*
///
-(NSNumber*) postSlidesSaveAsTiffWithCompletionBlock: (NSString*) name
         options: (ASPTiffExportOptions*) options
         password: (NSString*) password
         storage: (NSString*) storage
         folder: (NSString*) folder
         outPath: (NSString*) outPath
        
        completionHandler: (void (^)(ASPBaseResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `postSlidesSaveAsTiff`"];
    }
    
    // verify the required parameter 'options' is set
    if (options == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `options` when calling `postSlidesSaveAsTiff`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/saveAs/tiff"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(password != nil) {
        
        queryParams[@"password"] = password;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
    }
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
    }
    if(outPath != nil) {
        
        queryParams[@"outPath"] = outPath;
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
    
    bodyParam = options;
    

    
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
/// Read presentation slides info.
/// 
///  @param name The presentation name.
///
///  @param folder The presentation folder.
///
///  @param storage Presentation storage.
///
///  @returns ASPSlideListResponse*
///
-(NSNumber*) getSlidesSlidesListWithCompletionBlock: (NSString*) name
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPSlideListResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `getSlidesSlidesList`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/slides"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
                                         responseType: @"ASPSlideListResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPSlideListResponse*)data, error);
              }
          ];
}

///
/// Reorder presentation slide position
/// 
///  @param name The presentation name.
///
///  @param oldPosition The new presentation slide position.
///
///  @param newPosition The new presentation slide position.
///
///  @param folder The presentation folder.
///
///  @param storage The presentation storage.
///
///  @returns ASPSlideListResponse*
///
-(NSNumber*) postSlidesReorderPositionWithCompletionBlock: (NSString*) name
         oldPosition: (NSNumber*) oldPosition
         newPosition: (NSNumber*) newPosition
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPSlideListResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `postSlidesReorderPosition`"];
    }
    
    // verify the required parameter 'oldPosition' is set
    if (oldPosition == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `oldPosition` when calling `postSlidesReorderPosition`"];
    }
    
    // verify the required parameter 'newPosition' is set
    if (newPosition == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `newPosition` when calling `postSlidesReorderPosition`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/slides"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(oldPosition != nil) {
        
        queryParams[@"oldPosition"] = oldPosition;
    }
    if(newPosition != nil) {
        
        queryParams[@"newPosition"] = newPosition;
    }
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
                                         responseType: @"ASPSlideListResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPSlideListResponse*)data, error);
              }
          ];
}

///
/// Delete presentation slides.
/// 
///  @param name The presentation name.
///
///  @param folder The presentation folder.
///
///  @param storage Presentation storage.
///
///  @returns ASPSlideListResponse*
///
-(NSNumber*) deleteSlidesCleanSlidesListWithCompletionBlock: (NSString*) name
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPSlideListResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `deleteSlidesCleanSlidesList`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/slides"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
                                         responseType: @"ASPSlideListResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPSlideListResponse*)data, error);
              }
          ];
}

///
/// Read slide info.
/// 
///  @param name 
///
///  @param slideIndex 
///
///  @param folder 
///
///  @param storage 
///
///  @returns ASPBaseResponse*
///
-(NSNumber*) getSlidesSlideWithCompletionBlock: (NSString*) name
         slideIndex: (NSNumber*) slideIndex
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPBaseResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `getSlidesSlide`"];
    }
    
    // verify the required parameter 'slideIndex' is set
    if (slideIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `slideIndex` when calling `getSlidesSlide`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/slides/{slideIndex}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    if (slideIndex != nil) {
        pathParams[@"slideIndex"] = slideIndex;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
                                         responseType: @"ASPBaseResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPBaseResponse*)data, error);
              }
          ];
}

///
/// Delete presentation slide by its index.
/// 
///  @param name The presentation name.
///
///  @param slideIndex The slide index.
///
///  @param folder The presentation folder.
///
///  @param storage The presentation storage.
///
///  @returns ASPSlideListResponse*
///
-(NSNumber*) deleteSlideByIndexWithCompletionBlock: (NSString*) name
         slideIndex: (NSNumber*) slideIndex
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPSlideListResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `deleteSlideByIndex`"];
    }
    
    // verify the required parameter 'slideIndex' is set
    if (slideIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `slideIndex` when calling `deleteSlideByIndex`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/slides/{slideIndex}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    if (slideIndex != nil) {
        pathParams[@"slideIndex"] = slideIndex;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
                                         responseType: @"ASPSlideListResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPSlideListResponse*)data, error);
              }
          ];
}

///
/// Read presentation slide background color type.
/// 
///  @param name 
///
///  @param slideIndex 
///
///  @param folder 
///
///  @param storage 
///
///  @returns ASPSlideBackgroundResponse*
///
-(NSNumber*) getSlidesSlideBackgroundWithCompletionBlock: (NSString*) name
         slideIndex: (NSNumber*) slideIndex
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPSlideBackgroundResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `getSlidesSlideBackground`"];
    }
    
    // verify the required parameter 'slideIndex' is set
    if (slideIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `slideIndex` when calling `getSlidesSlideBackground`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/slides/{slideIndex}/background"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    if (slideIndex != nil) {
        pathParams[@"slideIndex"] = slideIndex;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
                                         responseType: @"ASPSlideBackgroundResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPSlideBackgroundResponse*)data, error);
              }
          ];
}

///
/// Set presentation slide background color.
/// 
///  @param name 
///
///  @param slideIndex 
///
///  @param color 
///
///  @param folder 
///
///  @param storage 
///
///  @returns ASPSlideBackgroundResponse*
///
-(NSNumber*) putSlidesSlideBackgroundWithCompletionBlock: (NSString*) name
         slideIndex: (NSNumber*) slideIndex
         color: (NSString*) color
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPSlideBackgroundResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `putSlidesSlideBackground`"];
    }
    
    // verify the required parameter 'slideIndex' is set
    if (slideIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `slideIndex` when calling `putSlidesSlideBackground`"];
    }
    
    // verify the required parameter 'color' is set
    if (color == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `color` when calling `putSlidesSlideBackground`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/slides/{slideIndex}/background"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    if (slideIndex != nil) {
        pathParams[@"slideIndex"] = slideIndex;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
    NSString *requestContentType = [ASPApiClient selectHeaderContentType:@[@"application/json", @"text/json", @"application/xml", @"text/xml", @"text/javascript", @"application/x-www-form-urlencoded"]];

    // Authentication setting
    NSArray *authSettings = @[];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *files = [[NSMutableDictionary alloc] init];
    
    bodyParam = color;
    

    
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
                                         responseType: @"ASPSlideBackgroundResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPSlideBackgroundResponse*)data, error);
              }
          ];
}

///
/// Remove presentation slide background color.
/// 
///  @param name 
///
///  @param slideIndex 
///
///  @param folder 
///
///  @param storage 
///
///  @returns ASPSlideBackgroundResponse*
///
-(NSNumber*) deleteSlidesSlideBackgroundWithCompletionBlock: (NSString*) name
         slideIndex: (NSNumber*) slideIndex
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPSlideBackgroundResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `deleteSlidesSlideBackground`"];
    }
    
    // verify the required parameter 'slideIndex' is set
    if (slideIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `slideIndex` when calling `deleteSlidesSlideBackground`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/slides/{slideIndex}/background"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    if (slideIndex != nil) {
        pathParams[@"slideIndex"] = slideIndex;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
                                         responseType: @"ASPSlideBackgroundResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPSlideBackgroundResponse*)data, error);
              }
          ];
}

///
/// Read presentation slide comments.
/// 
///  @param name 
///
///  @param slideIndex 
///
///  @param folder 
///
///  @param storage 
///
///  @returns ASPSlideCommentsResponse*
///
-(NSNumber*) getSlidesSlideCommentsWithCompletionBlock: (NSString*) name
         slideIndex: (NSNumber*) slideIndex
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPSlideCommentsResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `getSlidesSlideComments`"];
    }
    
    // verify the required parameter 'slideIndex' is set
    if (slideIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `slideIndex` when calling `getSlidesSlideComments`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/slides/{slideIndex}/comments"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    if (slideIndex != nil) {
        pathParams[@"slideIndex"] = slideIndex;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
                                         responseType: @"ASPSlideCommentsResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPSlideCommentsResponse*)data, error);
              }
          ];
}

///
/// Read slide images info.
/// 
///  @param name Presentation name.
///
///  @param slideIndex The slide index.
///
///  @param folder Presentation folder.
///
///  @param storage Document's storage.
///
///  @returns ASPImagesResponse*
///
-(NSNumber*) getSlidesSlideImagesWithCompletionBlock: (NSString*) name
         slideIndex: (NSNumber*) slideIndex
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPImagesResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `getSlidesSlideImages`"];
    }
    
    // verify the required parameter 'slideIndex' is set
    if (slideIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `slideIndex` when calling `getSlidesSlideImages`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/slides/{slideIndex}/images"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    if (slideIndex != nil) {
        pathParams[@"slideIndex"] = slideIndex;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
                                         responseType: @"ASPImagesResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPImagesResponse*)data, error);
              }
          ];
}

///
/// Read slide placeholders info.
/// 
///  @param name Presentation name.
///
///  @param slideIndex Slide index.
///
///  @param folder Presentation folder.
///
///  @param storage Document's storage.
///
///  @returns ASPPlaceholdersResponse*
///
-(NSNumber*) getSlidesPlaceholdersWithCompletionBlock: (NSString*) name
         slideIndex: (NSNumber*) slideIndex
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPPlaceholdersResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `getSlidesPlaceholders`"];
    }
    
    // verify the required parameter 'slideIndex' is set
    if (slideIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `slideIndex` when calling `getSlidesPlaceholders`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/slides/{slideIndex}/placeholders"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    if (slideIndex != nil) {
        pathParams[@"slideIndex"] = slideIndex;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
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
                                         responseType: @"ASPPlaceholdersResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPPlaceholdersResponse*)data, error);
              }
          ];
}

///
/// Read slide placeholder info.
/// 
///  @param name Presentation name.
///
///  @param slideIndex Slide index.
///
///  @param placeholderIndex Pleceholder index.
///
///  @param folder Presentation folder.
///
///  @param storage Document's storage.
///
///  @returns ASPPlaceholderResponse*
///
-(NSNumber*) getSlidesPlaceholderWithCompletionBlock: (NSString*) name
         slideIndex: (NSNumber*) slideIndex
         placeholderIndex: (NSNumber*) placeholderIndex
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPPlaceholderResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `getSlidesPlaceholder`"];
    }
    
    // verify the required parameter 'slideIndex' is set
    if (slideIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `slideIndex` when calling `getSlidesPlaceholder`"];
    }
    
    // verify the required parameter 'placeholderIndex' is set
    if (placeholderIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `placeholderIndex` when calling `getSlidesPlaceholder`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/slides/{slideIndex}/placeholders/{placeholderIndex}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    if (slideIndex != nil) {
        pathParams[@"slideIndex"] = slideIndex;
    }
    if (placeholderIndex != nil) {
        pathParams[@"placeholderIndex"] = placeholderIndex;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
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
                                         responseType: @"ASPPlaceholderResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPPlaceholderResponse*)data, error);
              }
          ];
}

///
/// Replace text by a new value.
/// 
///  @param name Presentation name.
///
///  @param slideIndex Slide's index.
///
///  @param oldValue Text to replace.
///
///  @param newerValue New text value.
///
///  @param ignoreCase Is case must be ignored.
///
///  @param folder Presentation folder.
///
///  @param storage Presentation storage.
///
///  @returns ASPSlideStringReplaceResponse*
///
-(NSNumber*) postSlidesSlideReplaceTextWithCompletionBlock: (NSString*) name
         slideIndex: (NSNumber*) slideIndex
         oldValue: (NSString*) oldValue
         newerValue: (NSString*) newerValue
         ignoreCase: (NSNumber*) ignoreCase
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPSlideStringReplaceResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `postSlidesSlideReplaceText`"];
    }
    
    // verify the required parameter 'slideIndex' is set
    if (slideIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `slideIndex` when calling `postSlidesSlideReplaceText`"];
    }
    
    // verify the required parameter 'oldValue' is set
    if (oldValue == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `oldValue` when calling `postSlidesSlideReplaceText`"];
    }
    
    // verify the required parameter 'newerValue' is set
    if (newerValue == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `newerValue` when calling `postSlidesSlideReplaceText`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/slides/{slideIndex}/replaceText"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    if (slideIndex != nil) {
        pathParams[@"slideIndex"] = slideIndex;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(oldValue != nil) {
        
        queryParams[@"oldValue"] = oldValue;
    }
    if(newerValue != nil) {
        
        queryParams[@"newerValue"] = newerValue;
    }
    if(ignoreCase != nil) {
        
        queryParams[@"ignoreCase"] = ignoreCase;
    }
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
                                         responseType: @"ASPSlideStringReplaceResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPSlideStringReplaceResponse*)data, error);
              }
          ];
}

///
/// Read slides shapes info.
/// 
///  @param name Presentation name.
///
///  @param slideIndex Slide index.
///
///  @param folder Presentation folder.
///
///  @param storage Presentation storage.
///
///  @returns ASPBaseResponse*
///
-(NSNumber*) getSlidesSlideShapesWithCompletionBlock: (NSString*) name
         slideIndex: (NSNumber*) slideIndex
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPBaseResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `getSlidesSlideShapes`"];
    }
    
    // verify the required parameter 'slideIndex' is set
    if (slideIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `slideIndex` when calling `getSlidesSlideShapes`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/slides/{slideIndex}/shapes"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    if (slideIndex != nil) {
        pathParams[@"slideIndex"] = slideIndex;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
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
                                         responseType: @"ASPBaseResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPBaseResponse*)data, error);
              }
          ];
}

///
/// Creates new shape.
/// 
///  @param name Presentation name.
///
///  @param slideIndex Slide index.
///
///  @param shape Shape.
///
///  @param folder Presentation folder.
///
///  @param storage Presentation storage.
///
///  @returns ASPBaseResponse*
///
-(NSNumber*) postAddNewShapeWithCompletionBlock: (NSString*) name
         slideIndex: (NSNumber*) slideIndex
         shape: (ASPShape*) shape
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPBaseResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `postAddNewShape`"];
    }
    
    // verify the required parameter 'slideIndex' is set
    if (slideIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `slideIndex` when calling `postAddNewShape`"];
    }
    
    // verify the required parameter 'shape' is set
    if (shape == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `shape` when calling `postAddNewShape`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/slides/{slideIndex}/shapes"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    if (slideIndex != nil) {
        pathParams[@"slideIndex"] = slideIndex;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
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
    
    bodyParam = shape;
    

    
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
/// Render shape to specified picture format.
/// 
///  @param name Presentation name.
///
///  @param slideIndex Slide index.
///
///  @param shapeIndex Index of shape starting from 1
///
///  @param format Export picture format.
///
///  @param folder Presentation folder.
///
///  @param storage Presentation storage.
///
///  @param scaleX X scale ratio.
///
///  @param scaleY Y scale ratio.
///
///  @param bounds Shape thumbnail bounds type.
///
///  @returns ASPBaseResponse*
///
-(NSNumber*) getShapeWithFormatWithCompletionBlock: (NSString*) name
         slideIndex: (NSNumber*) slideIndex
         shapeIndex: (NSNumber*) shapeIndex
         format: (NSString*) format
         folder: (NSString*) folder
         storage: (NSString*) storage
         scaleX: (NSNumber*) scaleX
         scaleY: (NSNumber*) scaleY
         bounds: (NSString*) bounds
        
        completionHandler: (void (^)(ASPBaseResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `getShapeWithFormat`"];
    }
    
    // verify the required parameter 'slideIndex' is set
    if (slideIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `slideIndex` when calling `getShapeWithFormat`"];
    }
    
    // verify the required parameter 'shapeIndex' is set
    if (shapeIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `shapeIndex` when calling `getShapeWithFormat`"];
    }
    
    // verify the required parameter 'format' is set
    if (format == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `format` when calling `getShapeWithFormat`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/slides/{slideIndex}/shapes/{shapeIndex}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    if (slideIndex != nil) {
        pathParams[@"slideIndex"] = slideIndex;
    }
    if (shapeIndex != nil) {
        pathParams[@"shapeIndex"] = shapeIndex;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(format != nil) {
        
        queryParams[@"format"] = format;
    }
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
    }
    if(scaleX != nil) {
        
        queryParams[@"scaleX"] = scaleX;
    }
    if(scaleY != nil) {
        
        queryParams[@"scaleY"] = scaleY;
    }
    if(bounds != nil) {
        
        queryParams[@"bounds"] = bounds;
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
                                         responseType: @"ASPBaseResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPBaseResponse*)data, error);
              }
          ];
}

///
/// Reads a list of paragraphs in shape's textBody.
/// 
///  @param name Presentation name.
///
///  @param slideIndex Index of slide starting from 1
///
///  @param shapeIndex Index of shape starting from 1
///
///  @param folder Presentation folder.
///
///  @param storage Presentation storage.
///
///  @returns ASPBaseResponse*
///
-(NSNumber*) getSlideShapeParagraphsWithCompletionBlock: (NSString*) name
         slideIndex: (NSNumber*) slideIndex
         shapeIndex: (NSNumber*) shapeIndex
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPBaseResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `getSlideShapeParagraphs`"];
    }
    
    // verify the required parameter 'slideIndex' is set
    if (slideIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `slideIndex` when calling `getSlideShapeParagraphs`"];
    }
    
    // verify the required parameter 'shapeIndex' is set
    if (shapeIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `shapeIndex` when calling `getSlideShapeParagraphs`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/slides/{slideIndex}/shapes/{shapeIndex}/paragraphs"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    if (slideIndex != nil) {
        pathParams[@"slideIndex"] = slideIndex;
    }
    if (shapeIndex != nil) {
        pathParams[@"shapeIndex"] = shapeIndex;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
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
                                         responseType: @"ASPBaseResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPBaseResponse*)data, error);
              }
          ];
}

///
/// Reads paragraph in shape's textBody.
/// 
///  @param name Presentation name.
///
///  @param slideIndex Index of slide starting from 1
///
///  @param shapeIndex Index of shape starting from 1
///
///  @param paragraphIndex Index of paragraph starting from 1
///
///  @param folder Presentation folder.
///
///  @param storage Document's storage.
///
///  @returns ASPBaseResponse*
///
-(NSNumber*) getShapeParagraphWithCompletionBlock: (NSString*) name
         slideIndex: (NSNumber*) slideIndex
         shapeIndex: (NSNumber*) shapeIndex
         paragraphIndex: (NSNumber*) paragraphIndex
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPBaseResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `getShapeParagraph`"];
    }
    
    // verify the required parameter 'slideIndex' is set
    if (slideIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `slideIndex` when calling `getShapeParagraph`"];
    }
    
    // verify the required parameter 'shapeIndex' is set
    if (shapeIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `shapeIndex` when calling `getShapeParagraph`"];
    }
    
    // verify the required parameter 'paragraphIndex' is set
    if (paragraphIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `paragraphIndex` when calling `getShapeParagraph`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/slides/{slideIndex}/shapes/{shapeIndex}/paragraphs/{paragraphIndex}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    if (slideIndex != nil) {
        pathParams[@"slideIndex"] = slideIndex;
    }
    if (shapeIndex != nil) {
        pathParams[@"shapeIndex"] = shapeIndex;
    }
    if (paragraphIndex != nil) {
        pathParams[@"paragraphIndex"] = paragraphIndex;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
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
                                         responseType: @"ASPBaseResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPBaseResponse*)data, error);
              }
          ];
}

///
/// Reads paragraph portion in shape's textBody.
/// 
///  @param name Presentation name.
///
///  @param slideIndex Index of slide starting from 1
///
///  @param shapeIndex Index of shape starting from 1
///
///  @param paragraphIndex Index of paragraph starting from 1
///
///  @param portionIndex Index of portion starting from 1
///
///  @param folder Presentation folder.
///
///  @param storage Document's storage.
///
///  @returns ASPBaseResponse*
///
-(NSNumber*) getParagraphPortionWithCompletionBlock: (NSString*) name
         slideIndex: (NSNumber*) slideIndex
         shapeIndex: (NSNumber*) shapeIndex
         paragraphIndex: (NSNumber*) paragraphIndex
         portionIndex: (NSNumber*) portionIndex
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPBaseResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `getParagraphPortion`"];
    }
    
    // verify the required parameter 'slideIndex' is set
    if (slideIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `slideIndex` when calling `getParagraphPortion`"];
    }
    
    // verify the required parameter 'shapeIndex' is set
    if (shapeIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `shapeIndex` when calling `getParagraphPortion`"];
    }
    
    // verify the required parameter 'paragraphIndex' is set
    if (paragraphIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `paragraphIndex` when calling `getParagraphPortion`"];
    }
    
    // verify the required parameter 'portionIndex' is set
    if (portionIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `portionIndex` when calling `getParagraphPortion`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/slides/{slideIndex}/shapes/{shapeIndex}/paragraphs/{paragraphIndex}/portions/{portionIndex}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    if (slideIndex != nil) {
        pathParams[@"slideIndex"] = slideIndex;
    }
    if (shapeIndex != nil) {
        pathParams[@"shapeIndex"] = shapeIndex;
    }
    if (paragraphIndex != nil) {
        pathParams[@"paragraphIndex"] = paragraphIndex;
    }
    if (portionIndex != nil) {
        pathParams[@"portionIndex"] = portionIndex;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
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
                                         responseType: @"ASPBaseResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPBaseResponse*)data, error);
              }
          ];
}

///
/// Updates paragraph portion properties.
/// 
///  @param name 
///
///  @param slideIndex 
///
///  @param shapeIndex 
///
///  @param paragraphIndex 
///
///  @param portionIndex 
///
///  @param portion 
///
///  @param folder 
///
///  @param storage 
///
///  @returns ASPBaseResponse*
///
-(NSNumber*) putSetParagraphPortionPropertiesWithCompletionBlock: (NSString*) name
         slideIndex: (NSNumber*) slideIndex
         shapeIndex: (NSNumber*) shapeIndex
         paragraphIndex: (NSNumber*) paragraphIndex
         portionIndex: (NSNumber*) portionIndex
         portion: (ASPPortion*) portion
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPBaseResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `putSetParagraphPortionProperties`"];
    }
    
    // verify the required parameter 'slideIndex' is set
    if (slideIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `slideIndex` when calling `putSetParagraphPortionProperties`"];
    }
    
    // verify the required parameter 'shapeIndex' is set
    if (shapeIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `shapeIndex` when calling `putSetParagraphPortionProperties`"];
    }
    
    // verify the required parameter 'paragraphIndex' is set
    if (paragraphIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `paragraphIndex` when calling `putSetParagraphPortionProperties`"];
    }
    
    // verify the required parameter 'portionIndex' is set
    if (portionIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `portionIndex` when calling `putSetParagraphPortionProperties`"];
    }
    
    // verify the required parameter 'portion' is set
    if (portion == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `portion` when calling `putSetParagraphPortionProperties`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/slides/{slideIndex}/shapes/{shapeIndex}/paragraphs/{paragraphIndex}/portions/{portionIndex}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    if (slideIndex != nil) {
        pathParams[@"slideIndex"] = slideIndex;
    }
    if (shapeIndex != nil) {
        pathParams[@"shapeIndex"] = shapeIndex;
    }
    if (paragraphIndex != nil) {
        pathParams[@"paragraphIndex"] = paragraphIndex;
    }
    if (portionIndex != nil) {
        pathParams[@"portionIndex"] = portionIndex;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
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
    
    bodyParam = portion;
    

    
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
/// Read slide shapes or shape info.
/// 
///  @param name Presentation name.
///
///  @param slideIndex Slide index.
///
///  @param shapePath Shape path.
///
///  @param folder Presentation folder.
///
///  @param storage Presentation storage.
///
///  @returns ASPBaseResponse*
///
-(NSNumber*) getSlidesSlideShapesParentWithCompletionBlock: (NSString*) name
         slideIndex: (NSNumber*) slideIndex
         shapePath: (NSString*) shapePath
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPBaseResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `getSlidesSlideShapesParent`"];
    }
    
    // verify the required parameter 'slideIndex' is set
    if (slideIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `slideIndex` when calling `getSlidesSlideShapesParent`"];
    }
    
    // verify the required parameter 'shapePath' is set
    if (shapePath == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `shapePath` when calling `getSlidesSlideShapesParent`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/slides/{slideIndex}/shapes/{shapePath}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    if (slideIndex != nil) {
        pathParams[@"slideIndex"] = slideIndex;
    }
    if (shapePath != nil) {
        pathParams[@"shapePath"] = shapePath;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
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
                                         responseType: @"ASPBaseResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPBaseResponse*)data, error);
              }
          ];
}

///
/// Updates shape properties.
/// 
///  @param name Presentation name.
///
///  @param slideIndex Slide index.
///
///  @param shapePath Shape path.
///
///  @param shape Shape
///
///  @param folder Presentation folder.
///
///  @param storage Presentation storage.
///
///  @returns ASPBaseResponse*
///
-(NSNumber*) putSlideShapeInfoWithCompletionBlock: (NSString*) name
         slideIndex: (NSNumber*) slideIndex
         shapePath: (NSString*) shapePath
         shape: (ASPShape*) shape
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPBaseResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `putSlideShapeInfo`"];
    }
    
    // verify the required parameter 'slideIndex' is set
    if (slideIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `slideIndex` when calling `putSlideShapeInfo`"];
    }
    
    // verify the required parameter 'shapePath' is set
    if (shapePath == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `shapePath` when calling `putSlideShapeInfo`"];
    }
    
    // verify the required parameter 'shape' is set
    if (shape == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `shape` when calling `putSlideShapeInfo`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/slides/{slideIndex}/shapes/{shapePath}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    if (slideIndex != nil) {
        pathParams[@"slideIndex"] = slideIndex;
    }
    if (shapePath != nil) {
        pathParams[@"shapePath"] = shapePath;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
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
    
    bodyParam = shape;
    

    
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
/// Extract slide text items.
/// 
///  @param name Presentation name.
///
///  @param slideIndex Slide's index.
///
///  @param withEmpty Include empty items.
///
///  @param folder Presentation folder.
///
///  @param storage Presentation storage.
///
///  @returns ASPTextItemsResponse*
///
-(NSNumber*) getSlidesSlideTextItemsWithCompletionBlock: (NSString*) name
         slideIndex: (NSNumber*) slideIndex
         withEmpty: (NSNumber*) withEmpty
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPTextItemsResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `getSlidesSlideTextItems`"];
    }
    
    // verify the required parameter 'slideIndex' is set
    if (slideIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `slideIndex` when calling `getSlidesSlideTextItems`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/slides/{slideIndex}/textItems"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    if (slideIndex != nil) {
        pathParams[@"slideIndex"] = slideIndex;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(withEmpty != nil) {
        
        queryParams[@"withEmpty"] = withEmpty;
    }
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
                                         responseType: @"ASPTextItemsResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPTextItemsResponse*)data, error);
              }
          ];
}

///
/// Read slide theme info.
/// 
///  @param name Presentation name.
///
///  @param slideIndex Slide's index.
///
///  @param folder Presentation folder.
///
///  @param storage Presentation storage.
///
///  @returns ASPThemeResponse*
///
-(NSNumber*) getSlidesThemeWithCompletionBlock: (NSString*) name
         slideIndex: (NSNumber*) slideIndex
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPThemeResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `getSlidesTheme`"];
    }
    
    // verify the required parameter 'slideIndex' is set
    if (slideIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `slideIndex` when calling `getSlidesTheme`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/slides/{slideIndex}/theme"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    if (slideIndex != nil) {
        pathParams[@"slideIndex"] = slideIndex;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
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
                                         responseType: @"ASPThemeResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPThemeResponse*)data, error);
              }
          ];
}

///
/// Read slide theme color scheme info.
/// 
///  @param name Presentation name.
///
///  @param slideIndex Slide's index.
///
///  @param folder Presentation folder.
///
///  @param storage Presentation storage.
///
///  @returns ASPColorSchemeResponse*
///
-(NSNumber*) getSlidesThemeColorSchemeWithCompletionBlock: (NSString*) name
         slideIndex: (NSNumber*) slideIndex
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPColorSchemeResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `getSlidesThemeColorScheme`"];
    }
    
    // verify the required parameter 'slideIndex' is set
    if (slideIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `slideIndex` when calling `getSlidesThemeColorScheme`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/slides/{slideIndex}/theme/colorScheme"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    if (slideIndex != nil) {
        pathParams[@"slideIndex"] = slideIndex;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
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
                                         responseType: @"ASPColorSchemeResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPColorSchemeResponse*)data, error);
              }
          ];
}

///
/// Read slide theme font scheme info.
/// 
///  @param name Presentation name.
///
///  @param slideIndex Slide's index.
///
///  @param folder Presentation folder.
///
///  @param storage Presentation storage.
///
///  @returns ASPFontSchemeResponse*
///
-(NSNumber*) getSlidesThemeFontSchemeWithCompletionBlock: (NSString*) name
         slideIndex: (NSNumber*) slideIndex
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPFontSchemeResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `getSlidesThemeFontScheme`"];
    }
    
    // verify the required parameter 'slideIndex' is set
    if (slideIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `slideIndex` when calling `getSlidesThemeFontScheme`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/slides/{slideIndex}/theme/fontScheme"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    if (slideIndex != nil) {
        pathParams[@"slideIndex"] = slideIndex;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
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
                                         responseType: @"ASPFontSchemeResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPFontSchemeResponse*)data, error);
              }
          ];
}

///
/// Read slide theme color scheme info.
/// 
///  @param name Presentation name.
///
///  @param slideIndex Slide's index.
///
///  @param folder Presentation folder.
///
///  @param storage Presentation storage.
///
///  @returns ASPFormatSchemeResponse*
///
-(NSNumber*) getSlidesThemeFormatSchemeWithCompletionBlock: (NSString*) name
         slideIndex: (NSNumber*) slideIndex
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPFormatSchemeResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `getSlidesThemeFormatScheme`"];
    }
    
    // verify the required parameter 'slideIndex' is set
    if (slideIndex == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `slideIndex` when calling `getSlidesThemeFormatScheme`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/slides/{slideIndex}/theme/formatScheme"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    if (slideIndex != nil) {
        pathParams[@"slideIndex"] = slideIndex;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
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
                                         responseType: @"ASPFormatSchemeResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPFormatSchemeResponse*)data, error);
              }
          ];
}

///
/// Splitting presentations. Create one image per slide.
/// 
///  @param name The document name.
///
///  @param width The width of created images.
///
///  @param height The height of created images.
///
///  @param to The last slide number for splitting, if is not specified splitting ends at the last slide of the document.
///
///  @param from The start slide number for splitting, if is not specified splitting starts from the first slide of the presentation.
///
///  @param destFolder Folder on storage where images are going to be uploaded. If not specified then images are uploaded to same folder as presentation.
///
///  @param format The format. Default value is jpeg.
///
///  @param storage The document storage.
///
///  @param folder The document folder.
///
///  @returns ASPSplitDocumentResponse*
///
-(NSNumber*) postSlidesSplitWithCompletionBlock: (NSString*) name
         width: (NSNumber*) width
         height: (NSNumber*) height
         to: (NSNumber*) to
         from: (NSNumber*) from
         destFolder: (NSString*) destFolder
         format: (NSString*) format
         storage: (NSString*) storage
         folder: (NSString*) folder
        
        completionHandler: (void (^)(ASPSplitDocumentResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `postSlidesSplit`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/split"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(width != nil) {
        
        queryParams[@"width"] = width;
    }
    if(height != nil) {
        
        queryParams[@"height"] = height;
    }
    if(to != nil) {
        
        queryParams[@"to"] = to;
    }
    if(from != nil) {
        
        queryParams[@"from"] = from;
    }
    if(destFolder != nil) {
        
        queryParams[@"destFolder"] = destFolder;
    }
    if(format != nil) {
        
        queryParams[@"format"] = format;
    }
    if(storage != nil) {
        
        queryParams[@"storage"] = storage;
    }
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
                                         responseType: @"ASPSplitDocumentResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPSplitDocumentResponse*)data, error);
              }
          ];
}

///
/// Extract presentation text items.
/// 
///  @param name Presentation name.
///
///  @param withEmpty Incude empty items.
///
///  @param folder Presentation folder.
///
///  @param storage Presentation storage.
///
///  @returns ASPTextItemsResponse*
///
-(NSNumber*) getSlidesPresentationTextItemsWithCompletionBlock: (NSString*) name
         withEmpty: (NSNumber*) withEmpty
         folder: (NSString*) folder
         storage: (NSString*) storage
        
        completionHandler: (void (^)(ASPTextItemsResponse* output, NSError* error))completionBlock { 
        

    
    // verify the required parameter 'name' is set
    if (name == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `name` when calling `getSlidesPresentationTextItems`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/slides/{name}/textItems"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (name != nil) {
        pathParams[@"name"] = name;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(withEmpty != nil) {
        
        queryParams[@"withEmpty"] = withEmpty;
    }
    if(folder != nil) {
        
        queryParams[@"folder"] = folder;
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
                                         responseType: @"ASPTextItemsResponse*"
                                      completionBlock: ^(id data, NSError *error) {
                  
                  completionBlock((ASPTextItemsResponse*)data, error);
              }
          ];
}



@end
