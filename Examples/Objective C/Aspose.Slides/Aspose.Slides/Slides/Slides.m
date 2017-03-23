//
//  Slides.m
//  Aspose.Slides
//
//  Created by Muhammad Sohail Ismail on 16/03/2017.
//  Copyright © 2017 Aspose. All rights reserved.
//

#import "Slides.h"
#import "ASPSlidesApi.h"
#import "Utils.h"

@implementation Slides

- (id)init {
    self = [super init];
    
    self.slidesApi = [[ASPSlidesApi alloc] init];
    
    return self;
}

- (void)deleteSlideByIndex {
//ExStart:DeleteSlideByIndex
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi deleteSlideByIndexWithCompletionBlock:fileName
                                               slideIndex:[NSNumber numberWithInt:1]
                                                   folder:nil
                                                  storage:nil
                                        completionHandler:^(ASPSlideListResponse *output, NSError *error) {
                                            NSLog(@"%@", output);
                                        }];
//ExEnd:DeleteSlideByIndex
}

- (void)deleteSlidesCleanSlidesList {
//ExStart:DeleteSlidesCleanSlidesList
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi deleteSlidesCleanSlidesListWithCompletionBlock:fileName
                                                            folder:nil
                                                           storage:nil
                                                 completionHandler:^(ASPSlideListResponse *output, NSError *error) {
                                                     NSLog(@"%@", output);
                                                 }];
//ExEnd:DeleteSlidesCleanSlidesList
}

- (void)deleteSlidesSlideBackground {
//ExStart:DeleteSlidesSlideBackground
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi deleteSlidesSlideBackgroundWithCompletionBlock:fileName
                                                        slideIndex:[NSNumber numberWithInt:1]
                                                            folder:nil
                                                           storage:nil
                                                 completionHandler:^(ASPSlideBackgroundResponse *output, NSError *error) {
                                                     NSLog(@"%@", output);
                                                 }];
//ExEnd:DeleteSlidesSlideBackground
}

- (void)getSlideInSpecifiedFormatUsingThirdPartyStorage {
//ExStart:GetSlideInSpecifiedFormatUsingThirdPartyStorage
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlideWithFormatWithCompletionBlock:fileName
                                               slideIndex:[NSNumber numberWithInt:1]
                                                   format:@"pdf"
                                                    width:nil
                                                   height:nil
                                                   folder:nil
                                                  storage:@"MyDropboxStorage"
                                        completionHandler:^(NSURL *output, NSError *error) {
                                            NSLog(@"%@", output);
                                        }];
//ExEnd:GetSlideInSpecifiedFormatUsingThirdPartyStorage
}

- (void)getSlideWithFormat {
//ExStart:GetSlideWithFormat
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlideWithFormatWithCompletionBlock:fileName
                                               slideIndex:[NSNumber numberWithInt:1]
                                                   format:@"pdf"
                                                    width:nil
                                                   height:nil
                                                   folder:nil
                                                  storage:nil
                                        completionHandler:^(NSURL *output, NSError *error) {
                                            NSLog(@"%@", output);
                                        }];
//ExEnd:GetSlideWithFormat
}

- (void)getSlidesPlaceholder {
//ExStart:GetSlidesPlaceholder
    NSString *fileName = @"sample-input.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesPlaceholderWithCompletionBlock:fileName
                                                 slideIndex:[NSNumber numberWithInt:1]
                                           placeholderIndex:[NSNumber numberWithInt:0]
                                                     folder:nil
                                                    storage:nil
                                          completionHandler:^(ASPPlaceholderResponse *output, NSError *error) {
                                              NSLog(@"%@", output);
                                          }];
//ExEnd:GetSlidesPlaceholder
}

- (void)getSlidesPlaceholders {
//ExStart:GetSlidesPlaceholders
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesPlaceholdersWithCompletionBlock:fileName
                                                  slideIndex:[NSNumber numberWithInt:1]
                                                      folder:nil
                                                     storage:nil
                                           completionHandler:^(ASPPlaceholdersResponse *output, NSError *error) {
                                               NSLog(@"%@", output);
                                           }];
//ExEnd:GetSlidesPlaceholders
}

- (void)getSlidesSlide {
//ExStart:GetSlidesSlide
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesSlideWithCompletionBlock:fileName
                                           slideIndex:[NSNumber numberWithInt:1]
                                               folder:nil
                                              storage:nil
                                    completionHandler:^(ASPSlideResponse *output, NSError *error) {
                                        NSLog(@"%@", output);
                                    }];
//ExEnd:GetSlidesSlide
}

- (void)getSlidesSlideBackground {
//ExStart:GetSlidesSlideBackground
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesSlideBackgroundWithCompletionBlock:fileName
                                                     slideIndex:[NSNumber numberWithInt:1]
                                                         folder:nil
                                                        storage:nil
                                              completionHandler:^(ASPSlideBackgroundResponse *output, NSError *error) {
                                                  NSLog(@"%@", output);
                                              }];
//ExEnd:GetSlidesSlideBackground
}

- (void)getSlidesSlideComments {
//ExStart:GetSlidesSlideComments
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesSlideCommentsWithCompletionBlock:fileName
                                                   slideIndex:[NSNumber numberWithInt:1]
                                                       folder:nil
                                                      storage:nil
                                            completionHandler:^(ASPSlideCommentsResponse *output, NSError *error) {
                                                NSLog(@"%@", output);
                                            }];
//ExEnd:GetSlidesSlideComments
}

- (void)getSlidesSlidesList {
//ExStart:GetSlidesSlidesList
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesSlidesListWithCompletionBlock:fileName
                                                    folder:nil
                                                   storage:nil
                                         completionHandler:^(ASPSlideListResponse *output, NSError *error) {
                                             NSLog(@"%@", output);
                                         }];
//ExEnd:GetSlidesSlidesList
}

- (void)getSlidesThemeColorScheme {
//ExStart:GetSlidesThemeColorScheme
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesThemeColorSchemeWithCompletionBlock:fileName
                                                      slideIndex:[NSNumber numberWithInt:1]
                                                          folder:nil
                                                         storage:nil
                                               completionHandler:^(ASPColorSchemeResponse *output, NSError *error) {
                                                   NSLog(@"%@", output);
                                               }];
//ExEnd:GetSlidesThemeColorScheme
}

- (void)getSlidesThemeFontScheme {
//ExStart:GetSlidesThemeFontScheme
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesThemeFontSchemeWithCompletionBlock:fileName
                                                     slideIndex:[NSNumber numberWithInt:1]
                                                         folder:nil
                                                        storage:nil
                                              completionHandler:^(ASPFontSchemeResponse *output, NSError *error) {
                                                  NSLog(@"%@", output);
                                              }];
//ExEnd:GetSlidesThemeFontScheme
}

- (void)postAddEmptySlide {
//ExStart:PostAddEmptySlide
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi postAddEmptySlideWithCompletionBlock:fileName
                                                  folder:nil
                                                 storage:nil
                                       completionHandler:^(ASPSlideListResponse *output, NSError *error) {
                                           NSLog(@"%@", output);
                                       }];
//ExEnd:PostAddEmptySlide
}

- (void)postClonePresentationSlide {
//ExStart:PostClonePresentationSlide
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi postClonePresentationSlideWithCompletionBlock:fileName
                                                         position:[NSNumber numberWithInt:2]
                                                     slideToClone:[NSNumber numberWithInt:1]
                                                           folder:nil
                                                          storage:nil
                                                completionHandler:^(ASPSlideListResponse *output, NSError *error) {
                                                    NSLog(@"%@", output);
                                                }];
//ExEnd:PostClonePresentationSlide
}

- (void)postSlidesReorderPosition {
//ExStart:PostSlidesReorderPosition
    NSString *fileName = @"sample-input.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi postSlidesReorderPositionWithCompletionBlock:fileName
                                                     oldPosition:[NSNumber numberWithInt:1]
                                                     newPosition:[NSNumber numberWithInt:2]
                                                          folder:nil
                                                         storage:nil
                                               completionHandler:^(ASPSlideListResponse *output, NSError *error) {
                                                   NSLog(@"%@", output);
                                               }];
//ExEnd:PostSlidesReorderPosition
}

- (void)readPresentationSlidesInfo {
//ExStart:ReadPresentationSlidesInfo
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesSlidesListWithCompletionBlock:fileName
                                                    folder:nil
                                                   storage:nil
                                         completionHandler:^(ASPSlideListResponse *output, NSError *error) {
                                             NSLog(@"%@", output);
                                         }];
//ExEnd:ReadPresentationSlidesInfo
}

- (void)readPresentationSlidesInfoUsingThirdPartyStorage {
//ExStart:ReadPresentationSlidesInfoUsingThirdPartyStorage
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesSlidesListWithCompletionBlock:fileName
                                                    folder:nil
                                                   storage:@"MyDropboxStorage"
                                         completionHandler:^(ASPSlideListResponse *output, NSError *error) {
                                             NSLog(@"%@", output);
                                         }];
//ExEnd:ReadPresentationSlidesInfoUsingThirdPartyStorage

}

- (void)saveSlideAsImageWithSpecifiedSize {
//ExStart:SaveSlideAsImageWithSpecifiedSize
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlideWithFormatWithCompletionBlock:fileName
                                               slideIndex:[NSNumber numberWithInt:1]
                                                   format:@"pdf"
                                                    width:nil
                                                   height:nil
                                                   folder:nil
                                                  storage:nil
                                        completionHandler:^(NSURL *output, NSError *error) {
                                             NSLog(@"%@", output);
                                        }];
//ExEnd:SaveSlideAsImageWithSpecifiedSize
}

- (void)saveSlideAsImageWithSpecifiedSizeUsingThirdPartyStorage {
//ExStart:SaveSlideAsImageWithSpecifiedSizeUsingThirdPartyStorage
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlideWithFormatWithCompletionBlock:fileName
                                               slideIndex:[NSNumber numberWithInt:1]
                                                   format:@"pdf"
                                                    width:nil
                                                   height:nil
                                                   folder:nil
                                                  storage:@"MyDropboxStorage"
                                        completionHandler:^(NSURL *output, NSError *error) {
                                            NSLog(@"%@", output);
                                        }];
//ExEnd:SaveSlideAsImageWithSpecifiedSizeUsingThirdPartyStorage
}

@end
