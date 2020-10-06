#include <stdlib.h>

#import "NSArray+RawArray.h"
#import "NSNumber+OCGIFormResultType.h"
#import "OCGIFile.h"


@implementation OCGIFile
+(NSDictionary *) nameBy: (NSString *)name length: (NSNumber *)max
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

+(NSDictionary *) contentTypeBy: (NSString *)name length: (NSNumber *)max
{
    int _max = [max intValue];

    char *result = (char *) malloc(sizeof(char) * (_max + 1));
    if (!result)
        return nil;

    result[0] = '\0';

    cgiFormResultType status = cgiFormFileContentType(
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