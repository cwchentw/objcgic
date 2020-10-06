#include <stdlib.h>

#import "NSNumber+OCGIFormResultType.h"
#import "NSArray+RawArray.h"
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

-(OCGIFormResultType) close
{
    return cgiFormFileClose(file);
}

-(NSDictionary *) readWithSize: (NSNumber *)bufferSize
{
    int _bufferSize = [bufferSize intValue];

    char *buffer = NULL;
    int *gotP = NULL;
    NSString *_buffer = nil;
    NSDictionary *out = nil;

    gotP = (int *) malloc(sizeof(int));
    if (!gotP)
        goto ERROE_FUNCTION;

    buffer = (char *) malloc(sizeof(char) * (_bufferSize + 1));
    if (!buffer)
        goto ERROE_FUNCTION;

    buffer[0] = '\0';

    cgiFormResultType status = cgiFormFileRead(
	    file, buffer, _bufferSize, gotP);

    _buffer = [NSString stringWithCString: buffer];
    if (!_buffer)
        goto ERROE_FUNCTION;

    int _gotP = *gotP;

    out = [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithOCGIFormResultType: status], @"status",
        _buffer, @"buffer", _gotP, @"return"];
    if (!out)
        goto ERROE_FUNCTION;

    free(buffer);
    free(gotP);

    return out;

ERROE_FUNCTION:
    if (_buffer)
        [_buffer release];

    if (buffer)
        free(buffer);

    if (gotP)
        free(gotP);

    return nil;
}
@end