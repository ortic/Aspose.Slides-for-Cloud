#import "ASPLineFormat.h"

@implementation ASPLineFormat

/**
 * Maps json key to property name.
 * This method is used by `JSONModel`.
 */
+ (JSONKeyMapper *)keyMapper
{
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"Alignment": @"alignment", @"CapStyle": @"capStyle", @"DashStyle": @"dashStyle", @"JoinStyle": @"joinStyle", @"Style": @"style", @"BeginArrowHead": @"beginArrowHead", @"EndArrowHead": @"endArrowHead", @"CustomDashPattern": @"customDashPattern", @"FillFormat": @"fillFormat", @"MiterLimit": @"miterLimit", @"Width": @"width" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
  NSArray *optionalProperties = @[@"alignment", @"capStyle", @"dashStyle", @"joinStyle", @"style", @"beginArrowHead", @"endArrowHead", @"customDashPattern", @"fillFormat", @"miterLimit", @"width"];

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
