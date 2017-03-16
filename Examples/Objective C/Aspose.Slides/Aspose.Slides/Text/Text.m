//
//  Text.m
//  Aspose.Slides
//
//  Created by Muhammad Sohail Ismail on 16/03/2017.
//  Copyright © 2017 Aspose. All rights reserved.
//

#import "Text.h"
#import "ASPSlidesApi.h"
#import "Utils.h"

@implementation Text

- (id)init {
    self = [super init];
    
    self.slidesApi = [[ASPSlidesApi alloc] init];
    
    return self;
}

- (void)getSlidesPresentationTextItems {
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesPresentationTextItemsWithCompletionBlock:fileName
                                                            withEmpty:nil
                                                               folder:nil
                                                              storage:nil
                                                    completionHandler:^(ASPTextItemsResponse *output, NSError *error) {
                                                        NSLog(@"%@", output);
                                                    }];
}

- (void)getPresentationTextItemsUsingThirdPartyStorage {
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesPresentationTextItemsWithCompletionBlock:fileName
                                                            withEmpty:nil
                                                               folder:nil
                                                              storage:@"MyDropboxStorage"
                                                    completionHandler:^(ASPTextItemsResponse *output, NSError *error) {
                                                        NSLog(@"%@", output);
                                                    }];
}

- (void)getSlideTextItemsUsingThirdPartyStorage {
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesSlideTextItemsWithCompletionBlock:fileName
                                                    slideIndex:[NSNumber numberWithInt:1]
                                                     withEmpty:nil
                                                        folder:nil
                                                       storage:@"MyDropboxStorage"
                                             completionHandler:^(ASPTextItemsResponse *output, NSError *error) {
                                                 NSLog(@"%@", output);
                                             }];
}

- (void)getSlidesSlideTextItems {
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesSlideTextItemsWithCompletionBlock:fileName
                                                    slideIndex:[NSNumber numberWithInt:1]
                                                     withEmpty:nil
                                                        folder:nil
                                                       storage:nil
                                             completionHandler:^(ASPTextItemsResponse *output, NSError *error) {
                                                 NSLog(@"%@", output);
                                             }];
}

- (void)postSlidesPresentationReplaceText {
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi postSlidesPresentationReplaceTextWithCompletionBlock:fileName
                                                                oldValue:@"Aspose"
                                                                newValue:@"Aspose File Format APIs"
                                                              ignoreCase:nil
                                                                  folder:nil
                                                                 storage:nil
                                                       completionHandler:^(ASPPresentationStringReplaceResponse *output, NSError *error) {
                                                           NSLog(@"%@", output);
                                                       }];
}

- (void)postSlidesSlideReplaceText {
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    
    
    [self.slidesApi postSlidesSlideReplaceTextWithCompletionBlock:fileName
                                                       slideIndex:[NSNumber numberWithInt:1]
                                                         oldValue:@"Aspose"
                                                         newValue:@"Banckle"
                                                       ignoreCase:nil
                                                           folder:nil
                                                          storage:nil
                                                completionHandler:^(ASPSlideStringReplaceResponse *output, NSError *error) {
                                                    NSLog(@"%@", output);
                                                }];
}

@end
