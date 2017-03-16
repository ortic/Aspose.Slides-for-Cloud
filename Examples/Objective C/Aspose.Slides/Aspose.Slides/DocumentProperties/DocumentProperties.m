//
//  DocumentProperties.m
//  Aspose.Slides
//
//  Created by Muhammad Sohail Ismail on 14/03/2017.
//  Copyright © 2017 Aspose. All rights reserved.
//

#import "DocumentProperties.h"
#import "ASPSlidesApi.h"
#import "Utils.h"

@implementation DocumentProperties

- (id)init {
    self = [super init];
    
    self.slidesApi = [[ASPSlidesApi alloc] init];
    
    return self;
}

- (void)deleteSlidesDocumentProperties {
    NSString *fileName = @"sample-input.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi deleteSlidesDocumentPropertiesWithCompletionBlock:fileName
                                                               folder:nil
                                                              storage:nil
                                                    completionHandler:^(ASPDocumentPropertiesResponse *output, NSError *error) {
                                                        NSLog(@"%@", output);
                                                    }];
}

- (void)deleteSlidesDocumentProperty {
    NSString *fileName = @"sample-input.pptx";
    [Utils uploadFile:fileName];
    
    NSString *propertyName = @"AsposeAuthor";
    
    [self.slidesApi deleteSlidesDocumentPropertyWithCompletionBlock:fileName
                                                       propertyName:propertyName
                                                             folder:nil
                                                            storage:nil
                                                  completionHandler:^(ASPCommonResponse *output, NSError *error) {
                                                      NSLog(@"%@", output);
                                                  }];
}

- (void)getSlidesDocumentProperties {
    NSString *fileName = @"sample-input.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesDocumentPropertiesWithCompletionBlock:fileName
                                                            folder:nil
                                                           storage:nil
                                                 completionHandler:^(ASPDocumentPropertiesResponse *output, NSError *error) {
                                                     NSLog(@"%@", output);
                                                 }];
}

- (void)postSlidesSetDocumentProperties {
    NSString *fileName = @"sample-input.pptx";
    [Utils uploadFile:fileName];
    
    ASPDocumentProperties *documentProperties = [[ASPDocumentProperties alloc] init];
    
    ASPDocumentProperty *documentProperty = [[ASPDocumentProperty alloc] init];
    documentProperty.name = @"Author";
    documentProperty.value = @"Elon Musk";
    documentProperty.builtIn = [NSNumber numberWithBool:NO];
    documentProperties.list = (NSArray<ASPDocumentProperty> *)@[documentProperty];
    
    [self.slidesApi postSlidesSetDocumentPropertiesWithCompletionBlock:fileName
                                                            properties:documentProperties
                                                                folder:nil
                                                               storage:nil
                                                     completionHandler:^(ASPDocumentPropertiesResponse *output, NSError *error) {
                                                         NSLog(@"%@", output);
                                                     }];
}

- (void)putSlidesSetDocumentProperty {
    NSString *fileName = @"sample-input.pptx";
    [Utils uploadFile:fileName];
    
    NSString *propertyName = @"Author";
    
    ASPDocumentProperty *documentProperty = [[ASPDocumentProperty alloc] init];
    documentProperty.name = propertyName;
    documentProperty.value = @"Elon Musk";
    
    [self.slidesApi putSlidesSetDocumentPropertyWithCompletionBlock:fileName
                                                       propertyName:propertyName
                                                          _property:documentProperty
                                                             folder:nil
                                                            storage:nil
                                                  completionHandler:^(ASPDocumentPropertyResponse *output, NSError *error) {
                                                      NSLog(@"%@", output);
                                                  }];
}

@end
