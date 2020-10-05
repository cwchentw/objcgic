#include <stdlib.h>
#import "NSNumber+OCGIFormResultType.h"
#import "OCGIForm.h"

@implementation OCGIForm
+(NSDictionary *) stringBy: (NSString *)name length: (NSNumber *)max
{
    char *result = \
        (char *) malloc(sizeof(char) * ([max intValue] + 1));
    if (!result)
        return nil;

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
    if (!result)
        return nil;

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
    if (!result)
        return nil;

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
    if (!result)
        return nil;

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
    if (!result)
        return nil;

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
    if (!result)
        return nil;

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
    if (!result)
        return nil;

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

+(NSDictionary *) selectSingleBy: (NSString *)name \
    choices: (NSArray *)choices defaultValue: (NSNumber *)defaultV
{
    int *result = (int *) malloc(sizeof(int));
    if (!result)
        return nil;

    char **choicesText = [choices cStringArray];
    if (!choicesText) {
        free(result);
        return nil;
    }

    int choicesTotal = [choices count];

    cgiFormResultType status = cgiFormSelectSingle(
	    (char *)[name cString],
        choicesText, choicesTotal, 
	    result, [defaultV intValue]);

    int _result = *result;

    NSDictionary *out = [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithOCGIFormResultType: status], @"status",
        [NSNumber numberWithInt: _result], @"result"];

    /* FIXME: Check whether any memory corruption occurs. */
    {
        size_t i;
        for (i = 0; i < choicesTotal; ++i)
            free(choicesText[i]);
    }
    free(choicesText);
    free(result);

    return out;
}
@end