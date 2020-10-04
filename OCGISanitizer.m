#import "OCGISanitizer.h"

@implementation OCGISanitizer
+(OCGI_FORM_RESULT_TYPE) escapeHTML: (NSString *)s
{
    cgiFormResultType status = \
        cgiHtmlEscape([s cString]);

    return status;
}
@end