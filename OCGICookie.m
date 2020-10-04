#import <Foundation/Foundation.h>
#include "cgic.h"
#import "OCGICookie.h"


@implementation OCGICookie
+(NSDictionary *) by: (NSString *)name length: (NSNumber *)max
{
    char *result;

    cgiFormResultType status = \
        cgiCookieString(
            (char *)[name cString],
            result, [max intValue]);

    return [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithInt: status], @"status",
        [NSString stringWithCString: result], @"result"];
}

+(NSDictionary *) by: (NSString *)name defaultValue: (NSNumber *)defaultV
{
    int *result;

    cgiFormResultType status = \
        cgiCookieInteger(
            (char *)[name cString],
            result,
            [defaultV intValue]);

    return [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithInt: status], @"status",
        [NSNumber numberWithInt: *result], @"result"];
}

+(void) setBy: (NSString *)name to: (NSString *)value \
    toLive: (NSNumber *)secondsToLive \
    path: (NSString *)path domain: (NSString *)domain \
    options: (OCGI_COOKIE_OPTIONS) options
{
    cgiHeaderCookieSet(\
        (char *)[name cString],
        (char *)[value cString],
	    [secondsToLive intValue],
        (char *)[path cString],
        (char *)[domain cString],
        options);
}

+(void) setBy: (NSString *)name to: (NSString *)value \
    toLive: (NSNumber *)secondsToLive \
    path: (NSString *)path domain: (NSString *)domain
{
    cgiHeaderCookieSetString(\
        (char *)[name cString],
        (char *)[value cString],
	    [secondsToLive intValue],
        (char *)[path cString],
        (char *)[domain cString]);
}

+(void) setBy: (NSString *)name toInteger: (NSNumber *)value \
    toLive: (NSNumber *)secondsToLive \
    path: (NSString *)path domain: (NSString *)domain
{
    cgiHeaderCookieSetInteger(\
        (char *)[name cString],
        [value intValue],
	    [secondsToLive intValue],
        (char *)[path cString],
        (char *)[domain cString]);
}
@end