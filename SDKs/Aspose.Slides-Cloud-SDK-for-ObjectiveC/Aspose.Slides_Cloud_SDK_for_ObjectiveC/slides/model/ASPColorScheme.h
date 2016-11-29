#import <Foundation/Foundation.h>
#import "ASPObject.h"

/**
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen
 * Do not edit the class manually.
 */

#import "ASPResourceUri.h"


@protocol ASPColorScheme
@end

@interface ASPColorScheme : ASPObject


@property(nonatomic) NSString* accent1;

@property(nonatomic) NSString* accent2;

@property(nonatomic) NSString* accent3;

@property(nonatomic) NSString* accent4;

@property(nonatomic) NSString* accent5;

@property(nonatomic) NSString* accent6;

@property(nonatomic) NSString* dark1;

@property(nonatomic) NSString* dark2;

@property(nonatomic) NSString* followedHyperlink;

@property(nonatomic) NSString* hyperlink;

@property(nonatomic) NSString* light1;

@property(nonatomic) NSString* light2;

@property(nonatomic) ASPResourceUri* selfUri;

@property(nonatomic) NSArray<ASPResourceUri>* alternateLinks;

@property(nonatomic) NSArray<ASPResourceUri>* links;

@end