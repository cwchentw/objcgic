#import <Foundation/Foundation.h>
#import "NSNumber+OCGIFormResultType.h"
#import "OCGIEncoding.h"
#import "OCGICookie.h"


@implementation OCGICookie
+(NSDictionary *) stringBy:(NSString *)name length:(NSNumber *)max
{
    char *result = \
        (char *) malloc(sizeof(char) * ([max intValue] + 1));
    if (!result)
        return nil;

    result[0] = '\0';

    cgiFormResultType status = \
        cgiCookieString(
            (char *)[name cStringUsingEncoding:OCGI_ENCODING],
            result, [max intValue]);

    NSDictionary *out = [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithOCGIFormResultType:status], @"status",
        [NSString stringWithCString:result encoding:OCGI_ENCODING], @"result",
        nil];
    if (!out) {
        free(result);
        return nil;
    }

    free(result);

    return out;
}

+(NSDictionary *) integerBy:(NSString *)name defaultValue:(NSNumber *)defaultV
{
    int *result = (int *) malloc(sizeof(int));
    if (!result)
        return nil;

    cgiFormResultType status = \
        cgiCookieInteger(
            (char *)[name cStringUsingEncoding:OCGI_ENCODING],
            result,
            [defaultV intValue]);

    int _result = *result;

    NSDictionary *out = [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithOCGIFormResultType:status], @"status",
        [NSNumber numberWithInt:_result], @"result", nil];
    if (!out) {
        free(result);
        return nil;
    }

    free(result);

    return out;
}

+(void) setStringBy:(NSString *)name to:(NSString *)value \
    toLive:(NSNumber *)secondsToLive \
    path:(NSString *)path domain:(NSString *)domain \
    options:(OCGI_COOKIE_OPTIONS) options
{
    cgiHeaderCookieSet(
        (char *)[name cStringUsingEncoding:OCGI_ENCODING],
        (char *)[value cStringUsingEncoding:OCGI_ENCODING],
	    [secondsToLive intValue],
        (char *)[path cStringUsingEncoding:OCGI_ENCODING],
        (char *)[domain cStringUsingEncoding:OCGI_ENCODING],
        options);
}

+(void) setStringBy:(NSString *)name to:(NSString *)value \
    toLive:(NSNumber *)secondsToLive \
    path:(NSString *)path domain:(NSString *)domain
{
    cgiHeaderCookieSetString(
        (char *)[name cStringUsingEncoding:OCGI_ENCODING],
        (char *)[value cStringUsingEncoding:OCGI_ENCODING],
	    [secondsToLive intValue],
        (char *)[path cStringUsingEncoding:OCGI_ENCODING],
        (char *)[domain cStringUsingEncoding:OCGI_ENCODING]);
}

+(void) setIntegerBy:(NSString *)name to:(NSNumber *)value \
    toLive:(NSNumber *)secondsToLive \
    path:(NSString *)path domain:(NSString *)domain
{
    cgiHeaderCookieSetInteger(
        (char *)[name cStringUsingEncoding:OCGI_ENCODING],
        [value intValue],
	    [secondsToLive intValue],
        (char *)[path cStringUsingEncoding:OCGI_ENCODING],
        (char *)[domain cStringUsingEncoding:OCGI_ENCODING]);
}
@end