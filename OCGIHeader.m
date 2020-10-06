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

+(void) ok
{
    [[self class]
        status: [NSNumber numberWithInt: 200]
        message: OCGI_HTTP_STATUS_200];
}

+(void) notFound
{
    [[self class]
        status: [NSNumber numberWithInt: 404]
        message: OCGI_HTTP_STATUS_404];
}

+(void) internalServerError
{
    [[self class]
        status: [NSNumber numberWithInt: 500]
        message: OCGI_HTTP_STATUS_500];
}

+(void) forbidden
{
    [[self class]
        status: [NSNumber numberWithInt: 403]
        message: OCGI_HTTP_STATUS_403];
}
@end