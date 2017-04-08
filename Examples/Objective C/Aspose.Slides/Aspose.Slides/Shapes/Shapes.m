//
//  Shapes.m
//  Aspose.Slides
//
//  Created by Muhammad Sohail Ismail on 14/03/2017.
//  Copyright © 2017 Aspose. All rights reserved.
//

#import "Shapes.h"
#import "ASPSlidesApi.h"
#import "Utils.h"

@implementation Shapes

- (id)init {
    self = [super init];
    
    self.slidesApi = [[ASPSlidesApi alloc] init];
    
    return self;
}

- (void)extractShapesFromASlideUsingThirdPartStorage {
//ExStart:ExtractShapesFromASlideUsingThirdPartStorage
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesSlideShapesWithCompletionBlock:fileName
                                                 slideIndex:[NSNumber numberWithInt:1]
                                                     folder:nil
                                                    storage:@"MyDropboxStorage"
                                          completionHandler:^(ASPShapeResponse *output, NSError *error) {
                                              NSLog(@"%@", output);
                                          }];
//ExEnd:ExtractShapesFromASlideUsingThirdPartStorage
}

- (void)getSlidesSlideShapesParent {
//ExStart:GetSlidesSlideShapesParent
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesSlideShapesParentWithCompletionBlock:fileName
                                                       slideIndex:[NSNumber numberWithInt:1]
                                                        shapePath:@"1"
                                                           folder:nil
                                                          storage:nil
                                                completionHandler:^(ASPNewShapeResponse *output, NSError *error) {
                                                    NSLog(@"%@", output);
                                                }];
//ExEnd:GetSlidesSlideShapesParent
}

- (void)getSlidesSlideShapes {
//ExStart:GetSlidesSlideShapes
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesSlideShapesWithCompletionBlock:fileName
                                                 slideIndex:[NSNumber numberWithInt:1]
                                                     folder:nil
                                                    storage:nil
                                          completionHandler:^(ASPShapeResponse *output, NSError *error) {
                                              NSLog(@"%@", output);
                                          }];
//ExEnd:GetSlidesSlideShapes
    
    
    
    
}

@end
