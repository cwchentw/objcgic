#import "OCGISanitizer.h"

@implementation OCGISanitizer
+(OCGIFormResultType) escapeHTML: (NSString *)s
{
    cgiFormResultType status = \
        cgiHtmlEscape([s cString]);

    return status;
}

+(OCGIFormResultType) escapeHTML: (NSString *)data length: (NSNumber *)len
{
    cgiFormResultType status = \
        cgiHtmlEscapeData(
            [data cString],
            [len intValue]);

    return status;
}

+(OCGIFormResultType) escapeValue: (NSString *)s
{
    cgiFormResultType status = \
        cgiValueEscape([s cString]);

    return status;
}

+(OCGIFormResultType) eacapeValue: (NSString *)data length: (NSNumber *)len
{
    cgiFormResultType status = \
        cgiValueEscapeData(
            [data cString],
            [len intValue]);

    return status;
}
@end