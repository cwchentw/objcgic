#include <stdlib.h>

#import "NSArray+RawArray.h"
#import "NSNumber+OCGIFormResultType.h"
#import "OCGIForm.h"


@implementation OCGIForm
+(NSDictionary *) stringBy: (NSString *)name length: (NSNumber *)max
{
    int _max = [max intValue];

    char *result = \
        (char *) malloc(sizeof(char) * (_max + 1));
    if (!result)
        return nil;

    result[0] = '\0';

    cgiFormResultType status = \
        cgiFormString((char *)[name cString], result, _max);

    NSDictionary *out = [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithOCGIFormResultType: status], @"status",
        [NSString stringWithCString: result], @"result"];
    if (!out) {
        free(result);
        return nil;
    }

    free(result);

    return out;
}

+(NSDictionary *) stringNoNewlinesBy: (NSString *)name length: (NSNumber *)max
{
    int _max = [max intValue];

    char *result = \
        (char *) malloc(sizeof(char) * (_max + 1));
    if (!result)
        return nil;

    result[0] = '\0';

    cgiFormResultType status = \
        cgiFormStringNoNewlines((char *)[name cString], result, _max);

    NSDictionary *out = [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithOCGIFormResultType: status], @"status",
        [NSString stringWithCString: result], @"result"];
    if (!out) {
        free(result);
        return nil;
    }

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
    if (!out) {
        free(result);
        return nil;
    }

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
    if (!out) {
        free(result);
        return nil;
    }

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
    if (!out) {
        free(result);
        return nil;
    }

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
    if (!out) {
        free(result);
        return nil;
    }

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
    if (!out) {
        free(result);
        return nil;
    }

    free(result);

    return out;
}

+(NSDictionary *) selectSingleBy: (NSString *)name \
    choices: (NSArray *)choices defaultValue: (NSNumber *)defaultV
{
    int *result = NULL;
    char ** choicesText = NULL;
    NSDictionary *out = nil;

    result = (int *) malloc(sizeof(int));
    if (!result)
        goto ERROR_FUNCTION;

    choicesText = [choices cStringArray];
    if (!choicesText)
        goto ERROR_FUNCTION;

    int choicesTotal = [choices count];

    cgiFormResultType status = cgiFormSelectSingle(
	    (char *)[name cString],
        choicesText, choicesTotal, 
	    result, [defaultV intValue]);

    int _result = *result;

    out = [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithOCGIFormResultType: status], @"status",
        [NSNumber numberWithInt: _result], @"result"];
    if (!out)
        goto ERROR_FUNCTION;

    /* FIXME: Check whether any memory corruption occurs. */
    {
        size_t i;
        for (i = 0; i < choicesTotal; ++i)
            free(choicesText[i]);
    }
    free(choicesText);
    free(result);

    return out;

ERROR_FUNCTION:
    /* FIXME: Check whether any memory corruption occurs. */
    if (choicesText) {
        size_t i;
        for (i = 0; i < choicesTotal; ++i)
            free(choicesText[i]);
        free(choicesText);
    }

    if (result)
        free(result);

    return nil;
}

+(NSDictionary *) selectMultipleBy: (NSString *)name choices: (NSArray *)choices
{
    int *invalid = NULL;
    int *result = NULL;
    NSNumber **resultObjs = NULL;
    char **choicesText = NULL;
    NSArray *_result = nil;

    invalid = (int *) malloc(sizeof(int));
    if (!invalid)
        goto ERROR_FUNCTION;

    int choicesTotal = [choices count];

    result = (int *) malloc(sizeof(int) * choicesTotal);
    if (!result)
        goto ERROR_FUNCTION;

    resultObjs = (NSNumber **) malloc(sizeof(NSNumber *) * choicesTotal);
    if (!resultObjs)
        goto ERROR_FUNCTION;

    {
        size_t i;
        for (i = 0; i < choicesTotal; ++i)
            resultObjs[i] = nil;
    }

    choicesText = [choices cStringArray];
    if (!choicesText)
        goto ERROR_FUNCTION;

    cgiFormResultType status = cgiFormSelectMultiple(
	    (char *)[name cString], choicesText, choicesTotal, 
	    result, invalid);

    {
        size_t i;
        for (i = 0; i < choicesTotal; ++i)
            resultObjs[i] = [NSNumber numberWithInt: result[i]];
    }

    _result = [NSArray arrayWithObjects: resultObjs count: choicesTotal];
    if (nil == _result)
        goto ERROR_FUNCTION;

    int _invalid = *invalid;

    NSDictionary *out = [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithOCGIFormResultType: status], @"status",
        _result, @"result",
        [NSNumber numberWithInt: _invalid], @"invalid"];

    if (choicesText) {
        /* FIXME: Check whether any memory corruption. */
        size_t i;
        for (i = 0; i < choicesTotal; ++i)
            free(choicesText[i]);

        free(choicesText);
    }

    {
        size_t i;
        for (i = 0; i < choicesTotal; ++i)
            [resultObjs[i] release];
    }
    free(resultObjs);

    free(result);
    free(invalid);

    return out;

ERROR_FUNCTION:
    if (_result)
        [_result release];

    if (choicesText) {
        /* FIXME: Check whether any memory corruption. */
        size_t i;
        for (i = 0; i < choicesTotal; ++i)
            free(choicesText[i]);

        free(choicesText);
    }

    if (resultObjs) {
        size_t i;
        for (i = 0; i < choicesTotal; ++i)
            [resultObjs[i] release];

        free(resultObjs);
    }

    if (result)
        free(result);

    if (invalid)
        free(invalid);

    return nil;
}

+(NSNumber *) checoboxSingleBy: (NSString *)name
{
    cgiFormResultType status = cgiFormCheckboxSingle(
	    (char *)[name cString]);

    return [NSNumber numberWithOCGIFormResultType: status];
}

+(NSDictionary *) checkboxMultipleBy: (NSString *)name choices: (NSArray *)choices
{
    /* We peeked the source of cgic.c, recognizing that the implementation of
       `cgiFormCheckboxMultiple` is identical to `cgiFormSelectMultiple`.
       The relation may change in the future. */
    return [self selectMultipleBy: name choices: choices];
}

+(NSDictionary *) radioBy: (NSString *)name \
    values: (NSArray *)values defaultValue: (NSNumber *)defaultV
{
    /* We peeked the source of cgic.c, recognizing that the implementation of
       `cgiFormRadio` is identical to `cgiFormSelectSingle`.
       The relation may change in the future. */
    return [self selectSingleBy: name choices: values defaultValue: defaultV];
}

+(NSDictionary *) fileNameBy: (NSString *)name length: (NSNumber *)max
{
    int _max = [max intValue];

    char *result = (char *) malloc(sizeof(char) * (_max + 1));
    if (!result)
        return nil;

    result[0] = '\0';

    cgiFormResultType status = cgiFormFileName(
	    (char *)[name cString], result, _max);

    NSDictionary *out = [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithOCGIFormResultType: status], @"status",
        [NSString stringWithCString: result], @"result"];
    if (!out) {
        free(result);
        return nil;
    }

    free(result);

    return out;
}
@end