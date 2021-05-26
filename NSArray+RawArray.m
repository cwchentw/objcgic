#include <stdlib.h>

#import <Foundation/Foundation.h>
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
                (char *)[[self objectAtIndex:i]
                    cStringUsingEncoding:NSUTF8StringEncoding];
    }

    return arr;
}
@end