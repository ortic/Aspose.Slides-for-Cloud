#import "ASPPdfExportOptions.h"

@implementation ASPPdfExportOptions

/**
 * Maps json key to property name.
 * This method is used by `JSONModel`.
 */
+ (JSONKeyMapper *)keyMapper
{
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"TextCompression": @"textCompression", @"EmbedFullFonts": @"embedFullFonts", @"Compliance": @"compliance", @"JpegQuality": @"jpegQuality", @"SaveMetafilesAsPng": @"saveMetafilesAsPng", @"Password": @"password", @"EmbedTrueTypeFontsForASCII": @"embedTrueTypeFontsForASCII", @"ExportFormat": @"exportFormat" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
  NSArray *optionalProperties = @[@"textCompression", @"embedFullFonts", @"compliance", @"jpegQuality", @"saveMetafilesAsPng", @"password", @"embedTrueTypeFontsForASCII", @"exportFormat"];

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
