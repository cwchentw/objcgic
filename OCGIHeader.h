#pragma once

#import <Foundation/Foundation.h>
#include "cgic.h"

@interface OCGIHeader : NSObject {
    /* No instance field. */
}

+(void) location: (NSString *)redirectUrl;
+(void) status: (NSNumber *)status message: (NSString *)statusMessage;
@end