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
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesSlideImagesWithCompletionBlock:fileName
                                                 slideIndex:[NSNumber numberWithInt:1]
                                                     folder:nil
                                                    storage:nil
                                          completionHandler:^(ASPImagesResponse *output, NSError *error) {
                                              NSLog(@"%@", output);
                                          }];
}

- (void)getSlidesSlideImagesUsingThirdPartyStorage {
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesSlideImagesWithCompletionBlock:fileName
                                                 slideIndex:[NSNumber numberWithInt:1]
                                                     folder:nil
                                                    storage:@"dropboxstorage"
                                          completionHandler:^(ASPImagesResponse *output, NSError *error) {
                                              NSLog(@"%@", output);
                                          }];
}

- (void)getSlidesImages {
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesImagesWithCompletionBlock:fileName
                                                folder:nil
                                               storage:nil
                                     completionHandler:^(ASPImagesResponse *output, NSError *error) {
                                         NSLog(@"%@", output);
                                     }];
}

- (void)getSlidesImagesUsingThirdPartStorage {
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesImagesWithCompletionBlock:fileName
                                                folder:nil
                                               storage:@"dropboxstorage"
                                     completionHandler:^(ASPImagesResponse *output, NSError *error) {
                                         NSLog(@"%@", output);
                                     }];
}

@end
