#import <Foundation/Foundation.h>
#import "NSNumber+OCGIFormResultType.h"
#import "OCGICookie.h"


@implementation OCGICookie
+(NSDictionary *) stringBy: (NSString *)name length: (NSNumber *)max
{
    char *result = \
        (char *) malloc(sizeof(char) * ([max intValue] + 1));

    cgiFormResultType status = \
        cgiCookieString(
            (char *)[name cString],
            result, [max intValue]);

    return [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithOCGIFormResultType: status], @"status",
        [NSString stringWithCString: result], @"result"];
}

+(NSDictionary *) integerBy: (NSString *)name defaultValue: (NSNumber *)defaultV
{
    int *result = (int *) malloc(sizeof(int));

    cgiFormResultType status = \
        cgiCookieInteger(
            (char *)[name cString],
            result,
            [defaultV intValue]);

    return [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithOCGIFormResultType: status], @"status",
        [NSNumber numberWithInt: *result], @"result"];
}

+(void) setStringBy: (NSString *)name to: (NSString *)value \
    toLive: (NSNumber *)secondsToLive \
    path: (NSString *)path domain: (NSString *)domain \
    options: (OCGI_COOKIE_OPTIONS) options
{
    cgiHeaderCookieSet(
        (char *)[name cString],
        (char *)[value cString],
	    [secondsToLive intValue],
        (char *)[path cString],
        (char *)[domain cString],
        options);
}

+(void) setStringBy: (NSString *)name to: (NSString *)value \
    toLive: (NSNumber *)secondsToLive \
    path: (NSString *)path domain: (NSString *)domain
{
    cgiHeaderCookieSetString(
        (char *)[name cString],
        (char *)[value cString],
	    [secondsToLive intValue],
        (char *)[path cString],
        (char *)[domain cString]);
}

+(void) setIntegerBy: (NSString *)name to: (NSNumber *)value \
    toLive: (NSNumber *)secondsToLive \
    path: (NSString *)path domain: (NSString *)domain
{
    cgiHeaderCookieSetInteger(
        (char *)[name cString],
        [value intValue],
	    [secondsToLive intValue],
        (char *)[path cString],
        (char *)[domain cString]);
}
@end