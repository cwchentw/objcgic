#import "OCGISanitizer.h"

@implementation OCGISanitizer
+(OCGIFormResultType) escapeHTML: (NSString *)s
{
    cgiFormResultType status = \
        cgiHtmlEscape([s cStringUsingEncoding:NSUTF8StringEncoding]);

    return status;
}

+(OCGIFormResultType) escapeHTML: (NSString *)data length: (NSNumber *)len
{
    cgiFormResultType status = \
        cgiHtmlEscapeData(
            [data cStringUsingEncoding:NSUTF8StringEncoding],
            [len intValue]);

    return status;
}

+(OCGIFormResultType) escapeValue: (NSString *)s
{
    cgiFormResultType status = \
        cgiValueEscape([s cStringUsingEncoding:NSUTF8StringEncoding]);

    return status;
}

+(OCGIFormResultType) eacapeValue: (NSString *)data length: (NSNumber *)len
{
    cgiFormResultType status = \
        cgiValueEscapeData(
            [data cStringUsingEncoding:NSUTF8StringEncoding],
            [len intValue]);

    return status;
}
@end