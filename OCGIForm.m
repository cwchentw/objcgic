#include <stdlib.h>
#import "NSNumber+OCGIFormResultType.h"
#import "OCGIForm.h"

@implementation OCGIForm
+(NSDictionary *) stringBy: (NSString *)name length: (NSNumber *)max
{
    char *result = \
        (char *) malloc(sizeof(char) * ([max intValue] + 1));

    cgiFormResultType status = \
        cgiFormString(
	        (char *)[name cString],
            result,
            [max intValue]);

    NSDictionary *out = [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithOCGIFormResultType: status], @"status",
        [NSString stringWithCString: result], @"result"];

    free(result);

    return out;
}

+(NSDictionary *) stringNoNewlinesBy: (NSString *)name length: (NSNumber *)max
{
    char *result = \
        (char *) malloc(sizeof(char) * ([max intValue] + 1));

    cgiFormResultType status = \
        cgiFormStringNoNewlines(
	        (char *)[name cString],
            result,
            [max intValue]);

    NSDictionary *out = [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithOCGIFormResultType: status], @"status",
        [NSString stringWithCString: result], @"result"];

    free(result);

    return out;
}

+(NSDictionary *) stringSpaceNeededBy: (NSString *)name
{
    int *result = (int *) malloc(sizeof(int));

    cgiFormResultType status = \
        cgiFormStringSpaceNeeded(
	        (char *)[name cString],
            result);

    int _result = *result;

    NSDictionary *out = [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithOCGIFormResultType: status], @"status",
        [NSNumber numberWithInt: _result], @"result"];

    free(result);

    return out;
}

+(NSDictionary *) integerBy: (NSString *)name defaultValue: (NSNumber *)defaultV
{
    int *result = (int *) malloc(sizeof(int));

    cgiFormResultType status = \
        cgiFormInteger(
	        (char *)[name cString],
            result,
            [defaultV intValue]);

    int _result = *result;

    NSDictionary *out = [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithOCGIFormResultType: status], @"status",
        [NSNumber numberWithInt: _result], @"result"];

    free(result);

    return out;
}

+(NSDictionary *) integerBoundedBy: (NSString *)name \
    min: (NSNumber *)min max: (NSNumber *)max defaultValue: (NSNumber *)defaultV
{
    int *result = (int *) malloc(sizeof(int));

    cgiFormResultType status = \
        cgiFormIntegerBounded(
	        (char *)[name cString],
            result,
            [min intValue],
            [max intValue],
            [defaultV intValue]);

    int _result = *result;

    NSDictionary *out = [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithOCGIFormResultType: status], @"status",
        [NSNumber numberWithInt: _result], @"result"];

    free(result);

    return out;
}

+(NSDictionary *) doubleBy: (NSString *)name defaultValue: (NSNumber *)defaultV
{
    double *result = (double *) malloc(sizeof(double));

    cgiFormResultType status = \
        cgiFormDouble(
	        (char *)[name cString],
            result,
            [defaultV doubleValue]);

    int _result = *result;

    NSDictionary *out = [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithOCGIFormResultType: status], @"status",
        [NSNumber numberWithDouble: _result], @"result"];

    free(result);

    return out;
}

+(NSDictionary *) doubleBoundedBy: (NSString *)name \
    min: (NSNumber *)min max: (NSNumber *)max defaultValue: (NSNumber *)defaultV
{
    double *result = (double *) malloc(sizeof(double));

    cgiFormResultType status = \
        cgiFormDoubleBounded(
	        (char *)[name cString],
            result,
            [min doubleValue],
            [max doubleValue],
            [defaultV doubleValue]);

    double _result = *result;

    NSDictionary *out = [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithOCGIFormResultType: status], @"status",
        [NSNumber numberWithDouble: _result], @"result"];

    free(result);

    return out;
}
@end