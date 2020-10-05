#import <Foundation/Foundation.h>
#import "OCGIHeader.h"

@implementation OCGIHeader
+(void) location: (NSString *)redirectUrl
{
    cgiHeaderLocation((char *)[redirectUrl cString]);
}

+(void) status: (NSNumber *)status message: (NSString *)statusMessage
{
    cgiHeaderStatus(
        [status intValue],
        (char *)[statusMessage cString]);
}

+(void) contentType: (NSString *)mimeType
{
    cgiHeaderContentType((char *)[mimeType cString]);
}
@end