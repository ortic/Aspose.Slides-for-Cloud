#import "ASPColorScheme.h"

@implementation ASPColorScheme

/**
 * Maps json key to property name.
 * This method is used by `JSONModel`.
 */
+ (JSONKeyMapper *)keyMapper
{
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"Accent1": @"accent1", @"Accent2": @"accent2", @"Accent3": @"accent3", @"Accent4": @"accent4", @"Accent5": @"accent5", @"Accent6": @"accent6", @"Dark1": @"dark1", @"Dark2": @"dark2", @"FollowedHyperlink": @"followedHyperlink", @"Hyperlink": @"hyperlink", @"Light1": @"light1", @"Light2": @"light2", @"SelfUri": @"selfUri", @"AlternateLinks": @"alternateLinks", @"Links": @"links" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
  NSArray *optionalProperties = @[@"accent1", @"accent2", @"accent3", @"accent4", @"accent5", @"accent6", @"dark1", @"dark2", @"followedHyperlink", @"hyperlink", @"light1", @"light2", @"selfUri", @"alternateLinks", @"links"];

  if ([optionalProperties containsObject:propertyName]) {
    return YES;
  }
  else {
    return NO;
  }
}

/**
 * Gets the string presentation of the object.
 * This method will be called when logging model object using `NSLog`.
 */
- (NSString *)description {
    return [[self toDictionary] description];
}

@end
