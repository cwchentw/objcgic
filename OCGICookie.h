#pragma once

#import <Foundation/Foundation.h>
#include "cgic.h"

@interface OCGICookie : NSObject {
    /* No instance field. */
}

+(NSDictionary *) stringByName: (NSString *)name length: (NSNumber *)max;
@end
