#import <Foundation/Foundation.h>
#import "NSNumber+OCGIFormResultType.h"
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
            (char *)[name cStringUsingEncoding:NSUTF8StringEncoding],
            result, [max intValue]);

    NSDictionary *out = [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithOCGIFormResultType:status], @"status",
        [NSString stringWithCString:result encoding:NSUTF8StringEncoding], @"result",
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
            (char *)[name cStringUsingEncoding:NSUTF8StringEncoding],
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
        (char *)[name cStringUsingEncoding:NSUTF8StringEncoding],
        (char *)[value cStringUsingEncoding:NSUTF8StringEncoding],
	    [secondsToLive intValue],
        (char *)[path cStringUsingEncoding:NSUTF8StringEncoding],
        (char *)[domain cStringUsingEncoding:NSUTF8StringEncoding],
        options);
}

+(void) setStringBy:(NSString *)name to:(NSString *)value \
    toLive:(NSNumber *)secondsToLive \
    path:(NSString *)path domain:(NSString *)domain
{
    cgiHeaderCookieSetString(
        (char *)[name cStringUsingEncoding:NSUTF8StringEncoding],
        (char *)[value cStringUsingEncoding:NSUTF8StringEncoding],
	    [secondsToLive intValue],
        (char *)[path cStringUsingEncoding:NSUTF8StringEncoding],
        (char *)[domain cStringUsingEncoding:NSUTF8StringEncoding]);
}

+(void) setIntegerBy:(NSString *)name to:(NSNumber *)value \
    toLive:(NSNumber *)secondsToLive \
    path:(NSString *)path domain:(NSString *)domain
{
    cgiHeaderCookieSetInteger(
        (char *)[name cStringUsingEncoding:NSUTF8StringEncoding],
        [value intValue],
	    [secondsToLive intValue],
        (char *)[path cStringUsingEncoding:NSUTF8StringEncoding],
        (char *)[domain cStringUsingEncoding:NSUTF8StringEncoding]);
}
@end