//
//  Slides.h
//  Aspose.Slides
//
//  Created by Muhammad Sohail Ismail on 16/03/2017.
//  Copyright © 2017 Aspose. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ASPSlidesApi;

@interface Slides : NSObject

@property(nonatomic, strong) ASPSlidesApi *slidesApi;

- (void)deleteSlideByIndex;
- (void)deleteSlidesCleanSlidesList;
- (void)deleteSlidesSlideBackground;
- (void)getSlideInSpecifiedFormatUsingThirdPartyStorage;
- (void)getSlideWithFormat;
- (void)getSlidesPlaceholder;
- (void)getSlidesPlaceholders;
- (void)getSlidesSlide;
- (void)getSlidesSlideBackground;
- (void)getSlidesSlideComments;
- (void)getSlidesSlidesList;
- (void)getSlidesThemeColorScheme;
- (void)getSlidesThemeFontScheme;
- (void)postAddEmptySlide;
- (void)postClonePresentationSlide;
- (void)postSlidesReorderPosition;
- (void)readPresentationSlidesInfo;
- (void)readPresentationSlidesInfoUsingThirdPartyStorage;
- (void)saveSlideAsImageWithSpecifiedSize;
- (void)saveSlideAsImageWithSpecifiedSizeUsingThirdPartyStorage;

@end
