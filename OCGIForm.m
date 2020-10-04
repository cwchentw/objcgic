#import "OCGIForm.h"

@implementation OCGIForm
+(NSDictionary *) by: (NSString *)name length: (NSNumber *)max
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
@end