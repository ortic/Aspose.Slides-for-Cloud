//
//  Images.m
//  Aspose.Slides
//
//  Created by Muhammad Sohail Ismail on 14/03/2017.
//  Copyright © 2017 Aspose. All rights reserved.
//

#import "Images.h"
#import "ASPSlidesApi.h"
#import "Utils.h"

@implementation Images

- (id)init {
    self = [super init];
    
    self.slidesApi = [[ASPSlidesApi alloc] init];
    
    return self;
}

- (void)getSlidesSlideImages {
//ExStart:GetSlidesSlideImages
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesSlideImagesWithCompletionBlock:fileName
                                                 slideIndex:[NSNumber numberWithInt:1]
                                                     folder:nil
                                                    storage:nil
                                          completionHandler:^(ASPImagesResponse *output, NSError *error) {
                                              NSLog(@"%@", output);
                                          }];
//ExEnd:GetSlidesSlideImages
}

- (void)getSlidesSlideImagesUsingThirdPartyStorage {
//ExStart:GetSlidesSlideImagesUsingThirdPartyStorage
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesSlideImagesWithCompletionBlock:fileName
                                                 slideIndex:[NSNumber numberWithInt:1]
                                                     folder:nil
                                                    storage:@"dropboxstorage"
                                          completionHandler:^(ASPImagesResponse *output, NSError *error) {
                                              NSLog(@"%@", output);
                                          }];
//ExEnd:GetSlidesSlideImagesUsingThirdPartyStorage
}

- (void)getSlidesImages {
//ExStart:GetSlidesImages
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesImagesWithCompletionBlock:fileName
                                                folder:nil
                                               storage:nil
                                     completionHandler:^(ASPImagesResponse *output, NSError *error) {
                                         NSLog(@"%@", output);
                                     }];
//ExEnd:GetSlidesImages
}

- (void)getSlidesImagesUsingThirdPartStorage {
//ExStart:GetSlidesImagesUsingThirdPartStorage
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesImagesWithCompletionBlock:fileName
                                                folder:nil
                                               storage:@"dropboxstorage"
                                     completionHandler:^(ASPImagesResponse *output, NSError *error) {
                                         NSLog(@"%@", output);
                                     }];
//ExEnd:GetSlidesImagesUsingThirdPartStorage
}

@end
