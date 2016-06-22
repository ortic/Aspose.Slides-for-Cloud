//
//  ASPSlidesApiTestCase.m
//  Aspose.Slides_Cloud_SDK_for_ObjectiveC
//
//  Created by Muhammad Sohail Ismail on 26/10/2015.
//  Copyright © 2015 Aspose. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ASPStorageApi.h"
#import "ASPSlidesApi.h"

@interface ASPSlidesApiTestCase : XCTestCase
@property(nonatomic, strong) ASPSlidesApi *slidesApi;
@end

@implementation ASPSlidesApiTestCase

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.slidesApi = [[ASPSlidesApi alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)uploadFile:(NSString *) fileName {
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    ASPStorageApi *storageApi = [[ASPStorageApi alloc] init];
    
    NSURL *pathToFile = [[NSBundle mainBundle] URLForResource:[fileName stringByDeletingPathExtension] withExtension:[fileName pathExtension]];
    [storageApi putCreateWithCompletionBlock:fileName
                                        file:pathToFile
                                   versionId:nil
                                     storage:nil
                           completionHandler:^(ASPBaseResponse *output, NSError *error) {
                               XCTAssertNotNil(output, @"Failed to upload a specific file.");
                               [expectation fulfill];
                           }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testPutConvertDocument {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    NSURL *pathToFile = [[NSBundle mainBundle] URLForResource:@"sample" withExtension:@"pptx"];
    
    [self.slidesApi putSlidesConvertWithCompletionBlock:pathToFile
                                               password:nil
                                                 format:@"pdf"
                                                outPath:nil
                                      completionHandler:^(NSURL *output, NSError *error) {
                                         XCTAssertNotNil(output, @"Failed to convert presentation from request content to format specified.");
                                         [expectation fulfill];
                                     }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testGetSlidesDocument {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi getSlidesDocumentWithCompletionBlock:fileName
                                                password:nil
                                                 storage:nil
                                                  folder:nil
                                       completionHandler:^(ASPDocumentResponse *output, NSError *error) {
                                           XCTAssertNotNil(output, @"Failed to read presentation info.");
                                           XCTAssertEqualObjects(output.status, @"OK");
                                           [expectation fulfill];
                                      }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}


- (void)testPutNewPresentation {
    NSString *fileName = @"newPresentation.pptx";
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    NSURL *pathToFile = [[NSBundle mainBundle] URLForResource:@"sample" withExtension:@"pptx"];
    
    [self.slidesApi putNewPresentationWithCompletionBlock:fileName
                                                     file:pathToFile
                                                 password:nil
                                                  storage:nil
                                                   folder:nil
                                        completionHandler:^(ASPBaseResponse *output, NSError *error) {
                                            XCTAssertNotNil(output, @"Failed to create presentation");
                                            XCTAssertEqualObjects(output.status, @"Created");
                                            [expectation fulfill];
                                       }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}


- (void)testPostSlidesDocument {
    NSString *fileName = @"newPresentation.pptx";
    NSString *templatePath = @"sample.pptx";
    [self uploadFile:templatePath];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    NSURL *pathToFile = [[NSBundle mainBundle] URLForResource:@"Test" withExtension:@"html"];
    
    [self.slidesApi postSlidesDocumentWithCompletionBlock:fileName
                                             templatePath:templatePath
                                                     file:pathToFile
                                          templateStorage:nil
                                      isImageDataEmbeeded:nil
                                                 password:nil
                                                  storage:nil
                                                   folder:nil
                                        completionHandler:^(ASPBaseResponse *output, NSError *error) {
                                            XCTAssertNotNil(output, @"Failed to create presentation.");
                                            XCTAssertEqualObjects(output.status, @"Created");
                                            [expectation fulfill];
     }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}


- (void)testGetSlidesDocumentProperties {
    NSString *fileName = @"sample-input.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi getSlidesDocumentPropertiesWithCompletionBlock:fileName
                                                            folder:nil
                                                           storage:nil
                                                 completionHandler:^(ASPDocumentPropertiesResponse *output, NSError *error) {
                                                     XCTAssertNotNil(output, @"Failed to read presentation document properties.");
                                                     XCTAssertEqualObjects(output.status, @"OK");
                                                     [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}


- (void)testPostSlidesSetDocumentProperties {
    NSString *fileName = @"sample-input.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    ASPDocumentProperties *documentProperties = [[ASPDocumentProperties alloc] init];
    
    ASPDocumentProperty *documentProperty = [[ASPDocumentProperty alloc] init];
    documentProperty.name = @"Author";
    documentProperty.value = @"Elon Musk";
    
    documentProperties.list = (NSArray<ASPDocumentProperty> *)@[documentProperty];
    
    [self.slidesApi postSlidesSetDocumentPropertiesWithCompletionBlock:fileName
                                                            properties:documentProperties
                                                                folder:nil
                                                               storage:nil
                                                     completionHandler:^(ASPDocumentPropertiesResponse *output, NSError *error) {
                                                         XCTAssertNotNil(output, @"Failed to set document properties.");
                                                         XCTAssertEqualObjects(output.status, @"OK");
                                                         [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}


- (void)testDeleteSlidesDocumentProperties {
    NSString *fileName = @"sample-input.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi deleteSlidesDocumentPropertiesWithCompletionBlock:fileName
                                                               folder:nil
                                                              storage:nil
                                                    completionHandler:^(ASPDocumentPropertiesResponse *output, NSError *error) {
                                                        XCTAssertNotNil(output, @"Failed to clean document properties.");
                                                        XCTAssertEqualObjects(output.status, @"OK");
                                                        [expectation fulfill];
     }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}


- (void)testGetSlidesDocumentProperty {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi getSlidesDocumentPropertyWithCompletionBlock:fileName
                                                    propertyName:@"Author"
                                                          folder:nil
                                                         storage:nil
                                               completionHandler:^(ASPDocumentPropertyResponse *output, NSError *error) {
                                                   XCTAssertNotNil(output, @"Failed to read presentation document property.");
                                                   XCTAssertEqualObjects(output.status, @"OK");
                                                   [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}


- (void)testPutSlidesSetDocumentProperty {
    NSString *fileName = @"sample-input.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
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
                                                      XCTAssertNotNil(output, @"Failed to set document property.");
                                                      XCTAssertEqualObjects(output.status, @"OK");
                                                      [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}


- (void)testDeleteSlidesDocumentProperty {
    NSString *fileName = @"sample-input.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    NSString *propertyName = @"AsposeAuthor";
    
    [self.slidesApi deleteSlidesDocumentPropertyWithCompletionBlock:fileName
                                                       propertyName:propertyName
                                                             folder:nil
                                                            storage:nil
                                                  completionHandler:^(ASPCommonResponse *output, NSError *error) {
                                                      XCTAssertNotNil(output, @"Failed to delete document property.");
                                                      XCTAssertEqualObjects(output.status, @"OK");
                                                      [expectation fulfill];
     }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}


- (void)testPutSlidesDocumentFromHtml {
    NSString *fileName = @"newPresentation.pptx";
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    NSURL *pathToFile = [[NSBundle mainBundle] URLForResource:@"ReadMe" withExtension:@"html"];
    
    [self.slidesApi putSlidesDocumentFromHtmlWithCompletionBlock:fileName
                                                            file:pathToFile
                                                        password:nil
                                                         storage:nil
                                                          folder:nil
                                               completionHandler:^(ASPDocumentResponse *output, NSError *error) {
                                                   XCTAssertNotNil(output, @"Failed to create presentation document from html.");
                                                   XCTAssertEqualObjects(output.status, @"Created");
                                                   [expectation fulfill];
     }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}


- (void)testGetSlidesImages {
    NSString *fileName = @"sample-input.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi getSlidesImagesWithCompletionBlock:fileName
                                                folder:nil
                                               storage:nil
                                     completionHandler:^(ASPImagesResponse *output, NSError *error) {
                                         XCTAssertNotNil(output, @"Failed to read presentation images info");
                                         XCTAssertEqualObjects(output.status, @"OK");
                                         [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}


- (void)testPutPresentationMerge {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    NSString *mergeFileName1 = @"welcome.pptx";
    [self uploadFile:mergeFileName1];
    NSString *mergeFileName2 = @"demo.pptx";
    [self uploadFile:mergeFileName2];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
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
                                              XCTAssertNotNil(output, @"Failed to merge presentations.");
                                              XCTAssertEqualObjects(output.status, @"OK");
                                              [expectation fulfill];
     }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}


- (void)testPostPresentationMerge {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    NSString *mergeFileName1 = @"welcome.pptx";
    [self uploadFile:mergeFileName1];
    NSString *mergeFileName2 = @"demo.pptx";
    [self uploadFile:mergeFileName2];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    ASPPresentationsMergeRequest *mergeRequest = [[ASPPresentationsMergeRequest alloc] init];
    mergeRequest.presentationPaths = @[mergeFileName1, mergeFileName2];
    
    [self.slidesApi postPresentationMergeWithCompletionBlock:fileName
                                                     request:mergeRequest
                                                     storage:nil
                                                      folder:nil
                                           completionHandler:^(ASPDocumentResponse *output, NSError *error) {
                                               XCTAssertNotNil(output, @"Failed to merge presentations.");
                                               XCTAssertEqualObjects(output.status, @"OK");
                                               [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}


- (void)testPostSlidesPresentationReplaceText {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi postSlidesPresentationReplaceTextWithCompletionBlock:fileName
                                                                oldValue:@"aspose"
                                                                newValue:@"Aspose File Format APIs"
                                                              ignoreCase:nil
                                                                  folder:nil
                                                                 storage:nil
                                                       completionHandler:^(ASPPresentationStringReplaceResponse *output, NSError *error) {
                                                           XCTAssertNotNil(output, @"Failed to replace text by a new value.");
                                                           XCTAssertEqualObjects(output.status, @"OK");
                                                           [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}


- (void)testPostSlidesSaveAsHtml {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    ASPHtmlExportOptions *htmlExportOptions = [[ASPHtmlExportOptions alloc] init];
    htmlExportOptions.saveAsZip = [NSNumber numberWithBool:YES];
    
    [self.slidesApi postSlidesSaveAsHtmlWithCompletionBlock:fileName
                                                    options:htmlExportOptions
                                                   password:nil
                                                    storage:nil
                                                     folder:nil
                                                    outPath:nil
                                          completionHandler:^(NSURL* output, NSError *error) {
                                              XCTAssertNotNil(output, @"Failed to save presentation in html format with options.");
                                              [expectation fulfill];
     }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}


- (void)testPostSlidesSaveAsPdf {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    ASPPdfExportOptions *pdfExportOptions = [[ASPPdfExportOptions alloc] init];
    pdfExportOptions.jpegQuality = @"50";
    
    [self.slidesApi postSlidesSaveAsPdfWithCompletionBlock:fileName
                                                   options:pdfExportOptions
                                                  password:nil
                                                   storage:nil
                                                    folder:nil
                                                   outPath:nil
                                         completionHandler:^(NSURL *output, NSError *error) {
                                             XCTAssertNotNil(output, @"Failed to save presentation in pdf format with options.");
                                             [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}


- (void)testPostSlidesSaveAsTiff {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    ASPTiffExportOptions *tiffExportOptions = [[ASPTiffExportOptions alloc] init];
    tiffExportOptions.exportFormat = @"tiff";
    
    [self.slidesApi postSlidesSaveAsTiffWithCompletionBlock:fileName
                                                    options:tiffExportOptions
                                                   password:nil
                                                    storage:nil
                                                     folder:nil
                                                    outPath:nil
                                          completionHandler:^(NSURL *output, NSError *error) {
                                              XCTAssertNotNil(output, @"Failed to saves presentation in tiff format with options.");
                                              [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testGetSlidesSlidesList {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi getSlidesSlidesListWithCompletionBlock:fileName
                                                    folder:nil
                                                   storage:nil
                                         completionHandler:^(ASPSlideListResponse *output, NSError *error) {
                                             XCTAssertNotNil(output, @"Failed to read presentation slides info.");
                                             XCTAssertEqualObjects(output.status, @"OK");
                                             [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}


- (void)testPostSlidesReorderPosition {
    NSString *fileName = @"sample-input.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi postSlidesReorderPositionWithCompletionBlock:fileName
                                                     oldPosition:[NSNumber numberWithInt:1]
                                                     newPosition:[NSNumber numberWithInt:2]
                                                          folder:nil
                                                         storage:nil
                                               completionHandler:^(ASPSlideListResponse *output, NSError *error) {
                                                   XCTAssertNotNil(output, @"Failed to reorder presentation slide position.");
                                                   XCTAssertEqualObjects(output.status, @"OK");
                                                   [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testDeleteSlidesCleanSlidesList {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi deleteSlidesCleanSlidesListWithCompletionBlock:fileName
                                                            folder:nil
                                                           storage:nil
                                                 completionHandler:^(ASPSlideListResponse *output, NSError *error) {
                                                     XCTAssertNotNil(output, @"Failed to delete presentation slides.");
                                                     XCTAssertEqualObjects(output.status, @"OK");
                                                     [expectation fulfill];
     }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testGetSlidesSlide {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi getSlidesSlideWithCompletionBlock:fileName
                                           slideIndex:[NSNumber numberWithInt:1]
                                               folder:nil
                                              storage:nil
                                    completionHandler:^(ASPSlideResponse *output, NSError *error) {
                                        XCTAssertNotNil(output, @"Failed to read slide info.");
                                        XCTAssertEqualObjects(output.status, @"OK");
                                        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testDeleteSlideByIndex {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi deleteSlideByIndexWithCompletionBlock:fileName
                                               slideIndex:[NSNumber numberWithInt:1]
                                                   folder:nil
                                                  storage:nil
                                        completionHandler:^(ASPSlideListResponse *output, NSError *error) {
                                            XCTAssertNotNil(output, @"Failed to delete presentation slide by its index.");
                                            XCTAssertEqualObjects(output.status, @"OK");
                                            [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testGetSlidesSlideBackground {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi getSlidesSlideBackgroundWithCompletionBlock:fileName
                                                     slideIndex:[NSNumber numberWithInt:1]
                                                         folder:nil
                                                        storage:nil
                                              completionHandler:^(ASPSlideBackgroundResponse *output, NSError *error) {
                                                  XCTAssertNotNil(output, @"Failed to read presentation slide background color type.");
                                                  XCTAssertEqualObjects(output.status, @"OK");
                                                  [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testputSlidesSlideBackground {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi putSlidesSlideBackgroundWithCompletionBlock:fileName
                                                     slideIndex:[NSNumber numberWithInt:1]
                                                          color:@"#FFFF0000"
                                                         folder:nil
                                                        storage:nil
                                              completionHandler:^(ASPSlideBackgroundResponse *output, NSError *error) {
                                                  XCTAssertNotNil(output, @"Failed to set presentation slide background color.");
                                                  XCTAssertEqualObjects(output.status, @"OK");
                                                  [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testDeleteSlidesSlideBackground {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi deleteSlidesSlideBackgroundWithCompletionBlock:fileName
                                                        slideIndex:[NSNumber numberWithInt:1]
                                                            folder:nil
                                                           storage:nil
                                                 completionHandler:^(ASPSlideBackgroundResponse *output, NSError *error) {
                                                     XCTAssertNotNil(output, @"Failed to remove presentation slide background color.");
                                                     XCTAssertEqualObjects(output.status, @"OK");
                                                     [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testGetSlidesSlideComments {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi getSlidesSlideCommentsWithCompletionBlock:fileName
                                                   slideIndex:[NSNumber numberWithInt:1]
                                                       folder:nil
                                                      storage:nil
                                            completionHandler:^(ASPSlideCommentsResponse *output, NSError *error) {
                                                XCTAssertNotNil(output, @"Failed to read presentation slide comments.");
                                                XCTAssertEqualObjects(output.status, @"OK");
                                                [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testGetSlidesSlideImages {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi getSlidesSlideImagesWithCompletionBlock:fileName
                                                 slideIndex:[NSNumber numberWithInt:1]
                                                     folder:nil
                                                    storage:nil
                                          completionHandler:^(ASPImagesResponse *output, NSError *error) {
                                              XCTAssertNotNil(output, @"Failed to read slide images info.");
                                              XCTAssertEqualObjects(output.status, @"OK");
                                              [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testGetSlidesPlaceholders {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi getSlidesPlaceholdersWithCompletionBlock:fileName
                                                  slideIndex:[NSNumber numberWithInt:1]
                                                      folder:nil
                                                     storage:nil
                                           completionHandler:^(ASPPlaceholdersResponse *output, NSError *error) {
                                               XCTAssertNotNil(output, @"Failed to read slide placeholders info.");
                                               XCTAssertEqualObjects(output.status, @"OK");
                                               [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testGetSlidesPlaceholder {
    NSString *fileName = @"sample-input.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi getSlidesPlaceholderWithCompletionBlock:fileName
                                                 slideIndex:[NSNumber numberWithInt:1]
                                           placeholderIndex:[NSNumber numberWithInt:0]
                                                     folder:nil
                                                    storage:nil
                                          completionHandler:^(ASPPlaceholderResponse *output, NSError *error) {
                                              XCTAssertNotNil(output, @"Failed to read slide placeholder info.");
                                              XCTAssertEqualObjects(output.status, @"OK");
                                              [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testPostSlidesSlideReplaceText {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi postSlidesSlideReplaceTextWithCompletionBlock:fileName
                                                       slideIndex:[NSNumber numberWithInt:1]
                                                         oldValue:@"aspose"
                                                       newValue:@"Aspose File Format APIs"
                                                       ignoreCase:nil
                                                           folder:nil
                                                          storage:nil
                                                completionHandler:^(ASPSlideStringReplaceResponse *output, NSError *error) {
                                                    XCTAssertNotNil(output, @"Failed to replace text by a new value.");
                                                    XCTAssertEqualObjects(output.status, @"OK");
                                                    [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testGetSlidesSlideShapes {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi getSlidesSlideShapesWithCompletionBlock:fileName
                                                 slideIndex:[NSNumber numberWithInt:1]
                                                     folder:nil
                                                    storage:nil
                                          completionHandler:^(ASPShapeResponse *output, NSError *error) {
                                              XCTAssertNotNil(output, @"Failed to read slides shapes info.");
                                              XCTAssertEqualObjects(output.status, @"OK");
                                              [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testPostAddNewShape {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    ASPShape *share = [[ASPShape alloc] init];
    share.alternativeText = @"Aspose";
    share.shapeType = @"Line";
    
    [self.slidesApi postAddNewShapeWithCompletionBlock:fileName
                                            slideIndex:[NSNumber numberWithInt:1]
                                                 shape:share
                                                folder:nil
                                               storage:nil
                                     completionHandler:^(ASPNewShapeResponse *output, NSError *error) {
                                         XCTAssertNotNil(output, @"Failed to creates new shape.");
                                         XCTAssertEqualObjects(output.status, @"Created");
                                         [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testGetShapeWithFormat {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi getShapeWithFormatWithCompletionBlock:fileName
                                               slideIndex:[NSNumber numberWithInt:1]
                                               shapeIndex:[NSNumber numberWithInt:1]
                                                   format:@"png"
                                                   folder:nil
                                                  storage:nil
                                                   scaleX:nil
                                                   scaleY:nil
                                                   bounds:nil
                                        completionHandler:^(NSURL *output, NSError *error) {
                                            XCTAssertNotNil(output, @"Failed to render shape to specified picture format.");
                                            [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testGetSlideShapeParagraphs {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi getSlideShapeParagraphsWithCompletionBlock:fileName
                                                    slideIndex:[NSNumber numberWithInt:1]
                                                    shapeIndex:[NSNumber numberWithInt:1]
                                                        folder:nil
                                                       storage:nil
                                             completionHandler:^(ASPShapeParagraphsResponse *output, NSError *error) {
                                                 XCTAssertNotNil(output, @"Failed to reads a list of paragraphs in shape's textBody.");
                                                 XCTAssertEqualObjects(output.status, @"OK");
                                                 [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testGetShapeParagraph {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi getShapeParagraphWithCompletionBlock:fileName
                                              slideIndex:[NSNumber numberWithInt:1]
                                              shapeIndex:[NSNumber numberWithInt:1]
                                          paragraphIndex:[NSNumber numberWithInt:1]
                                                  folder:nil
                                                 storage:nil
                                       completionHandler:^(ASPShapeParagraphResponse *output, NSError *error) {
                                           XCTAssertNotNil(output, @"Failed to reads paragraph in shape's textBody.");
                                           XCTAssertEqualObjects(output.status, @"OK");
                                           [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testGetParagraphPortion {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi getParagraphPortionWithCompletionBlock:fileName
                                                slideIndex:[NSNumber numberWithInt:1]
                                                shapeIndex:[NSNumber numberWithInt:1]
                                            paragraphIndex:[NSNumber numberWithInt:1]
                                              portionIndex:[NSNumber numberWithInt:1]
                                                    folder:nil
                                                   storage:nil
                                         completionHandler:^(ASPParagraphPortionResponse *output, NSError *error) {
                                             XCTAssertNotNil(output, @"Failed to reads paragraph portion in shape's textBody.");
                                             XCTAssertEqualObjects(output.status, @"OK");
                                             [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testPutSetParagraphPortionProperties {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    ASPPortion *portion = [[ASPPortion alloc] init];
    portion.text = @"Aspose.Slides for iOS";
    portion.fontColor = @"#FFFF0000";
    
    [self.slidesApi putSetParagraphPortionPropertiesWithCompletionBlock:fileName
                                                             slideIndex:[NSNumber numberWithInt:1]
                                                             shapeIndex:[NSNumber numberWithInt:1]
                                                         paragraphIndex:[NSNumber numberWithInt:1]
                                                           portionIndex:[NSNumber numberWithInt:1]
                                                                portion:portion
                                                                 folder:nil
                                                                storage:nil
                                                      completionHandler:^(ASPParagraphPortionResponse *output, NSError *error) {
                                                          XCTAssertNotNil(output, @"Failed to updates paragraph portion properties.");
                                                          XCTAssertEqualObjects(output.status, @"OK");
                                                          [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testGetSlidesSlideShapesParent {
    NSString *fileName = @"sample-input.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi getSlidesSlideShapesParentWithCompletionBlock:fileName
                                                       slideIndex:[NSNumber numberWithInt:1]
                                                        shapePath:@"1"
                                                           folder:nil
                                                          storage:nil
                                                completionHandler:^(ASPNewShapeResponse *output, NSError *error) {
                                                     XCTAssertNotNil(output, @"Failed to read slide shapes or shape info.");
                                                     XCTAssertEqualObjects(output.status, @"OK");
                                                     [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testPutSlideShapeInfo {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    ASPShape *shape = [[ASPShape alloc] init];
    shape.alternativeText = @"Aspose";
    
    [self.slidesApi putSlideShapeInfoWithCompletionBlock:fileName
                                              slideIndex:[NSNumber numberWithInt:1]
                                               shapePath:@"1"
                                                   shape:shape
                                                  folder:nil
                                                 storage:nil
                                       completionHandler:^(ASPNewShapeResponse *output, NSError *error) {
                                           XCTAssertNotNil(output, @"Failed to updates shape properties.");
                                           XCTAssertEqualObjects(output.status, @"OK");
                                           [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testGetSlidesSlideTextItems {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi getSlidesSlideTextItemsWithCompletionBlock:fileName
                                                    slideIndex:[NSNumber numberWithInt:1]
                                                     withEmpty:nil
                                                        folder:nil
                                                       storage:nil
                                             completionHandler:^(ASPTextItemsResponse *output, NSError *error) {
                                                 XCTAssertNotNil(output, @"Failed to extract slide text items.");
                                                 XCTAssertEqualObjects(output.status, @"OK");
                                                 [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testGetSlidesTheme {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi getSlidesThemeWithCompletionBlock:fileName
                                           slideIndex:[NSNumber numberWithInt:1]
                                               folder:nil
                                              storage:nil
                                    completionHandler:^(ASPThemeResponse *output, NSError *error) {
                                        XCTAssertNotNil(output, @"Failed to read slide theme info.");
                                        XCTAssertEqualObjects(output.status, @"OK");
                                        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testGetSlidesThemeColorScheme {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi getSlidesThemeColorSchemeWithCompletionBlock:fileName
                                                      slideIndex:[NSNumber numberWithInt:1]
                                                          folder:nil
                                                         storage:nil
                                               completionHandler:^(ASPColorSchemeResponse *output, NSError *error) {
                                                   XCTAssertNotNil(output, @"Failed to read slide theme color scheme info.");
                                                   XCTAssertEqualObjects(output.status, @"OK");
                                                   [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testGetSlidesThemeFontScheme {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi getSlidesThemeFontSchemeWithCompletionBlock:fileName
                                                     slideIndex:[NSNumber numberWithInt:1]
                                                         folder:nil
                                                        storage:nil
                                              completionHandler:^(ASPFontSchemeResponse *output, NSError *error) {
                                                  XCTAssertNotNil(output, @"Failed to read slide theme font scheme info.");
                                                  XCTAssertEqualObjects(output.status, @"OK");
                                                  [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testGetSlidesThemeFormatScheme {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi getSlidesThemeFormatSchemeWithCompletionBlock:fileName
                                                       slideIndex:[NSNumber numberWithInt:1]
                                                           folder:nil
                                                          storage:nil
                                                completionHandler:^(ASPFormatSchemeResponse *output, NSError *error) {
                                                    XCTAssertNotNil(output, @"Failed to Read slide theme color scheme info.");
                                                    XCTAssertEqualObjects(output.status, @"OK");
                                                    [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testPostSlidesSplit {
    NSString *fileName = @"sample-input.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
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
                                         XCTAssertNotNil(output, @"Failed to split presentation.");
                                         XCTAssertEqualObjects(output.status, @"OK");
                                         [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testGetSlidesPresentationTextItems {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi getSlidesPresentationTextItemsWithCompletionBlock:fileName
                                                            withEmpty:nil
                                                               folder:nil
                                                              storage:nil
                                                    completionHandler:^(ASPTextItemsResponse *output, NSError *error) {
                                                        XCTAssertNotNil(output, @"Failed to extract presentation text items.");
                                                        XCTAssertEqualObjects(output.status, @"OK");
                                                        [expectation fulfill];
     }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testGetSlidesDocumentWithFormat {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi getSlidesDocumentWithFormatWithCompletionBlock:fileName
                                                            format:@"tiff"
                                                       jpegQuality:nil
                                                          password:nil
                                                           storage:nil
                                                            folder:nil
                                                           outPath:nil
                                                 completionHandler:^(NSURL *output, NSError *error) {
                                                     XCTAssertNotNil(output, @"Failed to get slides document in specified format");
                                                     [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testGetSlideWithFormat {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi getSlideWithFormatWithCompletionBlock:fileName
                                               slideIndex:[NSNumber numberWithInt:1]
                                                   format:@"pdf"
                                                    width:nil
                                                   height:nil
                                                   folder:nil
                                                  storage:nil
                                        completionHandler:^(NSURL *output, NSError *error) {
                                            XCTAssertNotNil(output, @"Failed to get slide in specified format");
                                            [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testPostAddEmptySlide {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi postAddEmptySlideWithCompletionBlock:fileName
                                                  folder:nil
                                                 storage:nil
                                       completionHandler:^(ASPSlideListResponse *output, NSError *error) {
                                           XCTAssertNotNil(output, @"Failed to add empty slide");
                                           XCTAssertEqualObjects(output.status, @"OK");
                                           [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testPostAddEmptySlideAtPosition {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi postAddEmptySlideAtPositionWithCompletionBlock:fileName
                                                          position:[NSNumber numberWithInt:1]
                                                            folder:nil
                                                           storage:nil
                                                 completionHandler:^(ASPSlideListResponse *output, NSError *error) {
                                                     XCTAssertNotNil(output, @"Failed to add empty slide at position");
                                                     XCTAssertEqualObjects(output.status, @"OK");
                                                     [expectation fulfill];
     }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testPostClonePresentationSlide {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi postClonePresentationSlideWithCompletionBlock:fileName
                                                         position:[NSNumber numberWithInt:1]
                                                     slideToClone:[NSNumber numberWithInt:1]
                                                           folder:nil
                                                          storage:nil
                                                completionHandler:^(ASPSlideListResponse *output, NSError *error) {
                                                    XCTAssertNotNil(output, @"Failed to clone presentation slide");
                                                    XCTAssertEqualObjects(output.status, @"OK");
                                                    [expectation fulfill];
     }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testPostCopySlideFromSourcePresentation {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    NSString *sourceFile = @"sample-input.pptx";
    [self uploadFile:sourceFile];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi postCopySlideFromSourcePresentationWithCompletionBlock:fileName
                                                               slideToCopy:[NSNumber numberWithInt:1]
                                                                    source:sourceFile
                                                                  position:[NSNumber numberWithInt:1]
                                                                    folder:nil
                                                                   storage:nil
                                                         completionHandler:^(ASPSlideListResponse *output, NSError *error) {
                                                             XCTAssertNotNil(output, @"Failed to cpoy slide from source presentation.");
                                                             XCTAssertEqualObjects(output.status, @"OK");
                                                             [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testPostAddSlideCopy {
    NSString *fileName = @"sample.pptx";
    [self uploadFile:fileName];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    [self.slidesApi postAddSlideCopyWithCompletionBlock:fileName
                                           slideToClone:[NSNumber numberWithInt:1]
                                                 folder:nil
                                                storage:nil
                                      completionHandler:^(ASPSlideListResponse *output, NSError *error) {
                                          XCTAssertNotNil(output, @"Failed to add slide copy.");
                                          XCTAssertEqualObjects(output.status, @"OK");
                                          [expectation fulfill];
     }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testPutNewPresentationFromStoredTemplate {
    NSString *fileName = @"newPresentation.pptx";
    NSString *templatePath = @"sample.pptx";
    [self uploadFile:templatePath];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@""];
    
    NSURL *pathToFile = [[NSBundle mainBundle] URLForResource:@"Test" withExtension:@"html"];
    
    [self.slidesApi putNewPresentationFromStoredTemplateWithCompletionBlock:fileName
                                                               templatePath:templatePath
                                                                       file:pathToFile
                                                            templateStorage:nil
                                                                   password:nil
                                                                    storage:nil
                                                                     folder:nil
                                                          completionHandler:^(ASPDocumentResponse *output, NSError *error) {
                                                              XCTAssertNotNil(output, @"Failed to add new presentation from stored template.");
                                                              XCTAssertEqualObjects(output.status, @"Created");
                                                              [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:180.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}


@end
