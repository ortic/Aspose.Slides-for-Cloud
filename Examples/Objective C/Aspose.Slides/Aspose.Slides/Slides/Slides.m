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
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi deleteSlideByIndexWithCompletionBlock:fileName
                                               slideIndex:[NSNumber numberWithInt:1]
                                                   folder:nil
                                                  storage:nil
                                        completionHandler:^(ASPSlideListResponse *output, NSError *error) {
                                            NSLog(@"%@", output);
                                        }];
}

- (void)deleteSlidesCleanSlidesList {
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi deleteSlidesCleanSlidesListWithCompletionBlock:fileName
                                                            folder:nil
                                                           storage:nil
                                                 completionHandler:^(ASPSlideListResponse *output, NSError *error) {
                                                     NSLog(@"%@", output);
                                                 }];
}

- (void)deleteSlidesSlideBackground {
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi deleteSlidesSlideBackgroundWithCompletionBlock:fileName
                                                        slideIndex:[NSNumber numberWithInt:1]
                                                            folder:nil
                                                           storage:nil
                                                 completionHandler:^(ASPSlideBackgroundResponse *output, NSError *error) {
                                                     NSLog(@"%@", output);
                                                 }];
}

- (void)getSlideInSpecifiedFormatUsingThirdPartyStorage {
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
}

- (void)getSlideWithFormat {
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
}

- (void)getSlidesPlaceholder {
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
}

- (void)getSlidesPlaceholders {
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesPlaceholdersWithCompletionBlock:fileName
                                                  slideIndex:[NSNumber numberWithInt:1]
                                                      folder:nil
                                                     storage:nil
                                           completionHandler:^(ASPPlaceholdersResponse *output, NSError *error) {
                                               NSLog(@"%@", output);
                                           }];
}

- (void)getSlidesSlide {
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesSlideWithCompletionBlock:fileName
                                           slideIndex:[NSNumber numberWithInt:1]
                                               folder:nil
                                              storage:nil
                                    completionHandler:^(ASPSlideResponse *output, NSError *error) {
                                        NSLog(@"%@", output);
                                    }];
}

- (void)getSlidesSlideBackground {
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesSlideBackgroundWithCompletionBlock:fileName
                                                     slideIndex:[NSNumber numberWithInt:1]
                                                         folder:nil
                                                        storage:nil
                                              completionHandler:^(ASPSlideBackgroundResponse *output, NSError *error) {
                                                  NSLog(@"%@", output);
                                              }];
}

- (void)getSlidesSlideComments {
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesSlideCommentsWithCompletionBlock:fileName
                                                   slideIndex:[NSNumber numberWithInt:1]
                                                       folder:nil
                                                      storage:nil
                                            completionHandler:^(ASPSlideCommentsResponse *output, NSError *error) {
                                                NSLog(@"%@", output);
                                            }];
}

- (void)getSlidesSlidesList {
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesSlidesListWithCompletionBlock:fileName
                                                    folder:nil
                                                   storage:nil
                                         completionHandler:^(ASPSlideListResponse *output, NSError *error) {
                                             NSLog(@"%@", output);
                                         }];
}

- (void)getSlidesThemeColorScheme {
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesThemeColorSchemeWithCompletionBlock:fileName
                                                      slideIndex:[NSNumber numberWithInt:1]
                                                          folder:nil
                                                         storage:nil
                                               completionHandler:^(ASPColorSchemeResponse *output, NSError *error) {
                                                   NSLog(@"%@", output);
                                               }];
}

- (void)getSlidesThemeFontScheme {
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesThemeFontSchemeWithCompletionBlock:fileName
                                                     slideIndex:[NSNumber numberWithInt:1]
                                                         folder:nil
                                                        storage:nil
                                              completionHandler:^(ASPFontSchemeResponse *output, NSError *error) {
                                                  NSLog(@"%@", output);
                                              }];
}

- (void)postAddEmptySlide {
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi postAddEmptySlideWithCompletionBlock:fileName
                                                  folder:nil
                                                 storage:nil
                                       completionHandler:^(ASPSlideListResponse *output, NSError *error) {
                                           NSLog(@"%@", output);
                                       }];
}

- (void)postClonePresentationSlide {
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
}

- (void)postSlidesReorderPosition {
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
}

- (void)readPresentationSlidesInfo {
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesSlidesListWithCompletionBlock:fileName
                                                    folder:nil
                                                   storage:nil
                                         completionHandler:^(ASPSlideListResponse *output, NSError *error) {
                                             NSLog(@"%@", output);
                                         }];
}

- (void)readPresentationSlidesInfoUsingThirdPartyStorage {
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesSlidesListWithCompletionBlock:fileName
                                                    folder:nil
                                                   storage:@"MyDropboxStorage"
                                         completionHandler:^(ASPSlideListResponse *output, NSError *error) {
                                             NSLog(@"%@", output);
                                         }];

}

- (void)saveSlideAsImageWithSpecifiedSize {
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
}

- (void)saveSlideAsImageWithSpecifiedSizeUsingThirdPartyStorage {
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
}

@end
