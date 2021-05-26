#pragma once

#include <Foundation/Foundation.h>
#include "RawArray.h"


@interface NSArray (RawArray)
-(char **) cStringArrayUsingEncoding:(NSStringEncoding)encoding;
@end