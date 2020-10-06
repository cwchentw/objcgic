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

+(NSDictionary *) fileSizeBy: (NSString *)name
{
    int *sizeP = (int *) malloc(sizeof(int));
    if (!sizeP)
        return nil;

    cgiFormResultType status = cgiFormFileSize(
	    (char *)[name cString], sizeP);

    int _sizeP = *sizeP;

    NSDictionary *out = [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithOCGIFormResultType: status], @"status",
        [NSNumber numberWithInt: _sizeP], @"size"];
    if (!out) {
        free(sizeP);
        return nil;
    }

    free(sizeP);

    return out;
}

-(NSDictionary *) open: (NSString *)name
{
    self = [[self class] alloc];
    if (!self)
        return nil;

    cgiFilePtr *cfpp = NULL;

    cgiFormResultType status = cgiFormFileOpen(
	    (char *)[name cString], cfpp);

    if (OCGI_FORM_SUCCESS == status && cfpp)
        file = *cfpp;
    else
        file = NULL;

    NSDictionary *out = [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithOCGIFormResultType: status], @"status",
        self, @"fileHandle"];
    if (!out) {
        cgiFormFileClose(file);
        return nil;
    }

    return out;
}
@end