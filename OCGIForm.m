#import "NSNumber+OCGIFormResultType.h"
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
        [NSNumber numberWithOCGIFormType: status], @"status",
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
        [NSNumber numberWithOCGIFormType: status], @"status",
        [NSString stringWithCString: result], @"result"];
}

+(NSDictionary *) stringSpaceNeededBy: (NSString *)name
{
    int *result;

    cgiFormResultType status = \
        cgiFormStringSpaceNeeded(
	        (char *)[name cString],
            result);

    return [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithOCGIFormType: status], @"status",
        [NSNumber numberWithInt: *result], @"result"];
}

+(NSDictionary *) integerBy: (NSString *)name defaultValue: (NSNumber *)defaultV
{
    int *result;

    cgiFormResultType status = \
        cgiFormInteger(\
	        (char *)[name cString],
            result,
            [defaultV intValue]);

    return [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithOCGIFormType: status], @"status",
        [NSNumber numberWithInt: *result], @"result"];
}

+(NSDictionary *) integerBoundedBy: (NSString *)name \
    min: (NSNumber *)min max: (NSNumber *)max defaultValue: (NSNumber *)defaultV
{
    int *result;

    cgiFormResultType status = \
        cgiFormIntegerBounded(\
	        (char *)[name cString],
            result,
            [min intValue],
            [max intValue],
            [defaultV intValue]);

    return [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithOCGIFormType: status], @"status",
        [NSNumber numberWithInt: *result], @"result"];
}
@end