#import "OCGIEncoding.h"
#import "OCGISanitizer.h"

@implementation OCGISanitizer
+(OCGIFormResultType) escapeHTML: (NSString *)s
{
    cgiFormResultType status = \
        cgiHtmlEscape([s cStringUsingEncoding:OCGI_ENCODING]);

    return status;
}

+(OCGIFormResultType) escapeHTML: (NSString *)data length: (NSNumber *)len
{
    cgiFormResultType status = \
        cgiHtmlEscapeData(
            [data cStringUsingEncoding:OCGI_ENCODING],
            [len intValue]);

    return status;
}

+(OCGIFormResultType) escapeValue: (NSString *)s
{
    cgiFormResultType status = \
        cgiValueEscape([s cStringUsingEncoding:OCGI_ENCODING]);

    return status;
}

+(OCGIFormResultType) eacapeValue: (NSString *)data length: (NSNumber *)len
{
    cgiFormResultType status = \
        cgiValueEscapeData(
            [data cStringUsingEncoding:OCGI_ENCODING],
            [len intValue]);

    return status;
}
@end