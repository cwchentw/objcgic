#pragma once

#include "cgic.h"

#import <Foundation/Foundation.h>


@interface OCGIFile : NSObject {
    /* No instance field. */
}

+(NSDictionary *) nameBy: (NSString *)name length: (NSNumber *)max;
+(NSDictionary *) contentTypeBy: (NSString *)name length: (NSNumber *)max;
+(NSDictionary *) fileSizeBy: (NSString *)name;
@end