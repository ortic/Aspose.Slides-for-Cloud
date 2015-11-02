#import "ASPSlide.h"

@implementation ASPSlide

/**
 * Maps json key to property name.
 * This method is used by `JSONModel`.
 */
+ (JSONKeyMapper *)keyMapper
{
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"Width": @"width", @"Height": @"height", @"Shapes": @"shapes", @"Theme": @"theme", @"Placeholders": @"placeholders", @"Images": @"images", @"Comments": @"comments", @"Background": @"background", @"SelfUri": @"selfUri", @"AlternateLinks": @"alternateLinks", @"Links": @"links" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
  NSArray *optionalProperties = @[@"width", @"height", @"shapes", @"theme", @"placeholders", @"images", @"comments", @"background", @"selfUri", @"alternateLinks", @"links"];

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
