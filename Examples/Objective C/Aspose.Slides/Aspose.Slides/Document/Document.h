//
//  Document.h
//  Aspose.Slides
//
//  Created by Muhammad Sohail Ismail on 14/03/2017.
//  Copyright © 2017 Aspose. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ASPSlidesApi;

@interface Document : NSObject

@property(nonatomic, strong) ASPSlidesApi *slidesApi;

- (void)putSlidesConvert;
- (void)getSlidesDocumentWithFormat;
- (void)postPresentationMerge;
- (void)postSlidesSplit;
- (void)putNewPresentation;
- (void)putPresentationMerge;

@end
