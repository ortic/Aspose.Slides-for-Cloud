//
//  Text.h
//  Aspose.Slides
//
//  Created by Muhammad Sohail Ismail on 16/03/2017.
//  Copyright © 2017 Aspose. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ASPSlidesApi;

@interface Text : NSObject

@property(nonatomic, strong) ASPSlidesApi *slidesApi;

- (void)getSlidesPresentationTextItems;
- (void)getPresentationTextItemsUsingThirdPartyStorage;
- (void)getSlideTextItemsUsingThirdPartyStorage;
- (void)getSlidesSlideTextItems;
- (void)postSlidesPresentationReplaceText;
- (void)postSlidesSlideReplaceText;

@end
