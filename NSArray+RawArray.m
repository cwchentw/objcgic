#import <Foundation/Foundation.h>
#include <stdlib.h>
#import "NSArray+RawArray.h"

@implementation NSArray (RawArray)
-(char **) cStringArray
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
                (char *)[[self objectAtIndex: i]
                    cString];
    }

    return arr;
}
@end