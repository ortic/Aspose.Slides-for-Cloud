//
//  AppDelegate.m
//  Aspose.Slides
//
//  Created by Muhammad Sohail Ismail on 14/03/2017.
//  Copyright © 2017 Aspose. All rights reserved.
//

#import "AppDelegate.h"
#import "Document.h"
#import "DocumentProperties.h"
#import "Images.h"
#import "Shapes.h"
#import "Slides.h"
#import "Text.h"
#import "Utils.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //Get App key and App SID from https://cloud.aspose.com
    [Utils setAppKeyAndAppSID];
    
    Document *document = [[Document alloc] init];
    [document putSlidesConvert];
    [document getSlidesDocumentWithFormat];
    [document postPresentationMerge];
    [document postSlidesSplit];
    [document putNewPresentation];
    [document putPresentationMerge];
    
    DocumentProperties *documentProperties = [[DocumentProperties alloc] init];
    [documentProperties deleteSlidesDocumentProperties];
    [documentProperties deleteSlidesDocumentProperty];
    [documentProperties getSlidesDocumentProperties];
    [documentProperties postSlidesSetDocumentProperties];
    [documentProperties putSlidesSetDocumentProperty];
    
    Images *images = [[Images alloc] init];
    [images getSlidesSlideImages];
    [images getSlidesSlideImagesUsingThirdPartyStorage];
    [images getSlidesImages];
    [images getSlidesImagesUsingThirdPartStorage];
    
    Shapes *shapes = [[Shapes alloc] init];
    [shapes extractShapesFromASlideUsingThirdPartStorage];
    [shapes getSlidesSlideShapesParent];
    [shapes getSlidesSlideShapes];
    
    Slides *slides = [[Slides alloc] init];
    [slides deleteSlideByIndex];
    [slides deleteSlidesCleanSlidesList];
    [slides deleteSlidesSlideBackground];
    [slides getSlideInSpecifiedFormatUsingThirdPartyStorage];
    [slides getSlideWithFormat];
    [slides getSlidesPlaceholder];
    [slides getSlidesPlaceholders];
    [slides getSlidesSlide];
    [slides getSlidesSlideBackground];
    [slides getSlidesSlideComments];
    [slides getSlidesSlidesList];
    [slides getSlidesThemeColorScheme];
    [slides getSlidesThemeFontScheme];
    [slides postAddEmptySlide];
    [slides postClonePresentationSlide];
    [slides postSlidesReorderPosition];
    [slides readPresentationSlidesInfo];
    [slides readPresentationSlidesInfoUsingThirdPartyStorage];
    [slides saveSlideAsImageWithSpecifiedSize];
    [slides saveSlideAsImageWithSpecifiedSizeUsingThirdPartyStorage];
    
    Text *text = [[Text alloc] init];
    [text getSlidesPresentationTextItems];
    [text getPresentationTextItemsUsingThirdPartyStorage];
    [text getSlideTextItemsUsingThirdPartyStorage];
    [text getSlidesSlideTextItems];
    [text postSlidesPresentationReplaceText];
    [text postSlidesSlideReplaceText];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
