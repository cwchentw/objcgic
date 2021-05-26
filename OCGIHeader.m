#import <Foundation/Foundation.h>
#include <stdio.h>
#import "OCGIHeader.h"

@implementation OCGIHeader
+(void) location: (NSString *)redirectUrl
{
    cgiHeaderLocation((char *)[redirectUrl cStringUsingEncoding:NSUTF8StringEncoding]);
}

+(void) status: (NSNumber *)status message: (NSString *)statusMessage
{
    /* Originally, cgic append two lines of newline to
        the output of the header of a HTTP response.
        We may use multiple header informations in a
        response; therefore, we write our own code. */
    fprintf(stdout, "Status: %d %s\n",
        [status intValue],
        (char *)[statusMessage cStringUsingEncoding:NSUTF8StringEncoding]);
}

+(void) contentType: (NSString *)mimeType
{
    /* Originally, cgic append two lines of newline to
        the output of the header of a HTTP response.
        We may use multiple header informations in a
        response; therefore, we write our own code. */
    fprintf(stdout, "Content-type: %s\n",
        (char *)[mimeType cStringUsingEncoding:NSUTF8StringEncoding]);
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