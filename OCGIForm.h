#pragma once

#import <Foundation/Foundation.h>
#include "cgic.h"

@interface OCGIForm : NSObject {
    /* No instance field. */
}

+(NSDictionary *) stringBy: (NSString *)name length: (NSNumber *)max;
+(NSDictionary *) stringNoNewlinesBy: (NSString *)name length: (NSNumber *)max;
+(NSDictionary *) stringSpaceNeededBy: (NSString *)name;
+(NSDictionary *) integerBy: (NSString *)name defaultValue: (NSNumber *)defaultV;
+(NSDictionary *) integerBoundedBy: (NSString *)name \
    min: (NSNumber *)min max: (NSNumber *)max defaultValue: (NSNumber *)defaultV;
@end