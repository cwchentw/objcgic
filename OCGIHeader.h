#pragma once

#import <Foundation/Foundation.h>
#include "cgic.h"

@interface OCGIHeader : NSObject {
    /* No instance field. */
}

+(void) location: (NSString *)redirectUrl;
@end