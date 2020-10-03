#import <Foundation/Foundation.h>
#include "cgic.h"
#import "OCGICookie.h"


@implementation OCGICookie
+(NSDictionary *) stringByName: (NSString *)name length: (NSNumber *)max
{
    char *result;

    cgiFormResultType status = \
        cgiCookieString([name cString], result, [max intValue]);

    return [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithInt: status], @"status",
        [NSString stringWithCString: result], @"result"];
}

+(NSDictionary *) integerByName: (NSString *)name defaultValue: (NSNumber *)defaultV
{
    int *result;

    cgiFormResultType status = \
        cgiCookieInteger([name cString], result, [defaultV intValue]);

    return [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithInt: status], @"status",
        [NSNumber numberWithInt: *result], @"result"];
}
@end