#import "OCGISanitizer.h"

@implementation OCGISanitizer
+(OCGI_FORM_RESULT_TYPE) escapeHTML: (NSString *)s
{
    cgiFormResultType status = \
        cgiHtmlEscape([s cString]);

    return status;
}

+(OCGI_FORM_RESULT_TYPE) escapeHTML: (NSString *)data length: (NSNumber *)len
{
    cgiFormResultType status = \
        cgiHtmlEscapeData(\
            [data cString],
            [len intValue]);

    return status;
}
@end