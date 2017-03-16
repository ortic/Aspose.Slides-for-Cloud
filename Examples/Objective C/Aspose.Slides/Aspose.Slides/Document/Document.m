//
//  Document.m
//  Aspose.Slides
//
//  Created by Muhammad Sohail Ismail on 14/03/2017.
//  Copyright © 2017 Aspose. All rights reserved.
//

#import "Document.h"
#import "ASPSlidesApi.h"
#import "Utils.h"

@implementation Document

- (id)init {
    self = [super init];
    
    self.slidesApi = [[ASPSlidesApi alloc] init];
    
    return self;
}

- (void)putSlidesConvert {
    NSURL *pathToFile = [[NSBundle mainBundle] URLForResource:@"sample" withExtension:@"pptx"];
    
    [self.slidesApi putSlidesConvertWithCompletionBlock:pathToFile
                                               password:nil
                                                 format:@"pdf"
                                                outPath:nil
                                      completionHandler:^(NSURL *output, NSError *error) {
                                          NSLog(@"%@", output);
                                      }];
}

- (void)getSlidesDocumentWithFormat {
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi getSlidesDocumentWithFormatWithCompletionBlock:fileName
                                                            format:@"pdf"
                                                       jpegQuality:nil
                                                          password:nil
                                                           storage:nil
                                                            folder:nil
                                                           outPath:nil
                                                 completionHandler:^(NSURL *output, NSError *error) {
                                                     NSLog(@"%@", output);
                                                 }];
}

- (void)postPresentationMerge {
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    NSString *mergeFileName1 = @"welcome.pptx";
    [Utils uploadFile:mergeFileName1];
    NSString *mergeFileName2 = @"demo.pptx";
    [Utils uploadFile:mergeFileName2];
    
    ASPPresentationsMergeRequest *mergeRequest = [[ASPPresentationsMergeRequest alloc] init];
    mergeRequest.presentationPaths = @[mergeFileName1, mergeFileName2];
    
    [self.slidesApi postPresentationMergeWithCompletionBlock:fileName
                                                     request:mergeRequest
                                                     storage:nil
                                                      folder:nil
                                           completionHandler:^(ASPDocumentResponse *output, NSError *error) {
                                               NSLog(@"%@", output);
                                           }];
}

- (void)postSlidesSplit {
    NSString *fileName = @"sample-input.pptx";
    [Utils uploadFile:fileName];
    
    [self.slidesApi postSlidesSplitWithCompletionBlock:fileName
                                                 width:nil
                                                height:nil
                                                    to:[NSNumber numberWithInt:3]
                                                  from:[NSNumber numberWithInt:2]
                                            destFolder:nil
                                                format:@"png"
                                               storage:nil
                                                folder:nil
                                     completionHandler:^(ASPSplitDocumentResponse *output, NSError *error) {
                                         NSLog(@"%@", output);
                                     }];
}

- (void)putNewPresentation {
    NSString *fileName = [NSString stringWithFormat:@"%@%d%@", @"newPresentation", arc4random_uniform(100), @".pptx"];
    
    NSURL *pathToFile = [[NSBundle mainBundle] URLForResource:@"sample" withExtension:@"pptx"];
    
    [self.slidesApi putNewPresentationWithCompletionBlock:fileName
                                                     file:pathToFile
                                                 password:nil
                                                  storage:nil
                                                   folder:nil
                                        completionHandler:^(ASPBaseResponse *output, NSError *error) {
                                            NSLog(@"%@", output);
                                        }];
}

- (void)putPresentationMerge {
    NSString *fileName = @"sample.pptx";
    [Utils uploadFile:fileName];
    NSString *mergeFileName1 = @"welcome.pptx";
    [Utils uploadFile:mergeFileName1];
    NSString *mergeFileName2 = @"demo.pptx";
    [Utils uploadFile:mergeFileName2];
    
    ASPOrderedMergeRequest *orderedMergeRequest = [[ASPOrderedMergeRequest alloc] init];
    
    ASPPresentationToMerge *presentationToMerge1 = [[ASPPresentationToMerge alloc] init];
    presentationToMerge1.path = mergeFileName1;
    presentationToMerge1.slides = @[[NSNumber numberWithInt:1]];
    
    ASPPresentationToMerge *presentationToMerge2 = [[ASPPresentationToMerge alloc] init];
    presentationToMerge2.path = mergeFileName2;
    presentationToMerge2.slides = @[[NSNumber numberWithInt:1]];
    
    orderedMergeRequest.presentations = (NSArray<ASPPresentationToMerge> *)@[presentationToMerge1, presentationToMerge2];
    
    [self.slidesApi putPresentationMergeWithCompletionBlock:fileName
                                                    request:orderedMergeRequest
                                                    storage:nil
                                                     folder:nil
                                          completionHandler:^(ASPDocumentResponse *output, NSError *error) {
                                              NSLog(@"%@", output);
                                          }];
}

@end
