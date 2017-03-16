//
//  Shapes.h
//  Aspose.Slides
//
//  Created by Muhammad Sohail Ismail on 14/03/2017.
//  Copyright © 2017 Aspose. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ASPSlidesApi;

@interface Shapes : NSObject

@property(nonatomic, strong) ASPSlidesApi *slidesApi;

- (void)extractShapesFromASlideUsingThirdPartStorage;
- (void)getSlidesSlideShapesParent;
- (void)getSlidesSlideShapes;

@end
