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
//ExStart:GetSlidesPresentationTextItems
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesPresentationTextItemsWithCompletionBlock:fileName
                                                            withEmpty:nil
                                                               folder:nil
                                                              storage:nil
                                                    completionHandler:^(ASPTextItemsResponse *output, NSError *error) {
                                                        NSLog(@"%@", output);
                                                    }];
//ExEnd:GetSlidesPresentationTextItems
}

- (void)getPresentationTextItemsUsingThirdPartyStorage {
//ExStart:GetPresentationTextItemsUsingThirdPartyStorage
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesPresentationTextItemsWithCompletionBlock:fileName
                                                            withEmpty:nil
                                                               folder:nil
                                                              storage:@"MyDropboxStorage"
                                                    completionHandler:^(ASPTextItemsResponse *output, NSError *error) {
                                                        NSLog(@"%@", output);
                                                    }];
//ExEnd:GetPresentationTextItemsUsingThirdPartyStorage
}

- (void)getSlideTextItemsUsingThirdPartyStorage {
//ExStart:GetSlideTextItemsUsingThirdPartyStorage
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
//ExEnd:GetSlideTextItemsUsingThirdPartyStorage
}

- (void)getSlidesSlideTextItems {
//ExStart:GetSlidesSlideTextItems
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
//ExEnd:GetSlidesSlideTextItems
}

- (void)postSlidesPresentationReplaceText {
//ExStart:PostSlidesPresentationReplaceText
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
//ExEnd:PostSlidesPresentationReplaceText
}

- (void)postSlidesSlideReplaceText {
//ExStart:PostSlidesSlideReplaceText
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
//ExEnd:PostSlidesSlideReplaceText
}

@end
