#import "OCGIForm.h"

@implementation OCGIForm
+(NSDictionary *) stringBy: (NSString *)name length: (NSNumber *)max
{
    char *result;

    cgiFormResultType status = \
        cgiFormString(\
	        (char *)[name cString],
            result,
            [max intValue]);

    return [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithInt: status], @"status",
        [NSString stringWithCString: result], @"result"];
}

+(NSDictionary *) stringNoNewlinesBy: (NSString *)name length: (NSNumber *)max
{
    char *result;

    cgiFormResultType status = \
        cgiFormStringNoNewlines(\
	        (char *)[name cString],
            result,
            [max intValue]);

    return [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithInt: status], @"status",
        [NSString stringWithCString: result], @"result"];
}
@end