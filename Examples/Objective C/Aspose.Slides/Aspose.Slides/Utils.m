//
//  Utils.m
//  Aspose.Barcode
//
//  Created by Muhammad Sohail Ismail on 12/03/2017.
//  Copyright © 2017 Aspose. All rights reserved.
//

#import "Utils.h"
#import "ASPStorageApi.h"

@implementation Utils

+ (void) setAppKeyAndAppSID {
    //Get App key and App SID from https://cloud.aspose.com
    [ASPApiClient setAppKey:@"" andAppSID:@""];
}

+ (void)uploadFile:(NSString *) fileName {
    
    ASPStorageApi *storageApi = [[ASPStorageApi alloc] init];
    
    NSURL *pathToFile = [[NSBundle mainBundle] URLForResource:[fileName stringByDeletingPathExtension]
                                                withExtension:[fileName pathExtension]];
    
    [storageApi putCreateWithCompletionBlock:fileName
                                        file:pathToFile
                                   versionId:nil
                                     storage:nil
                           completionHandler:^(ASPBaseResponse *output, NSError *error) {
                               NSLog(@"UploadFile Code: %@ Status: %@", output.code, output.status);
                           }];
}

@end
