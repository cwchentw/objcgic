#include <stdlib.h>

#import <Foundation/Foundation.h>
#import "NSArray+RawArray.h"


@implementation NSArray (RawArray)
-(char **) cStringArrayUsingEncoding:(NSStringEncoding)encoding
{
    char **arr = \
        (char **) malloc(sizeof(char *) *
            [self count]);
    if (!arr)
        return NULL;

    {
        size_t i;
        for (i = 0; i < [self count]; ++i)
            arr[i] = \
                (char *)[[self objectAtIndex:i]
                    cStringUsingEncoding:encoding];
    }

    return arr;
}
@end