#pragma once

#include "cgic.h"

#import <Foundation/Foundation.h>


@interface OCGIForm : NSObject {
    /* No instance field. */
}

+(NSDictionary *) stringBy:(NSString *)name length:(NSNumber *)max;
+(NSDictionary *) stringNoNewlinesBy:(NSString *)name length:(NSNumber *)max;
+(NSDictionary *) stringSpaceNeededBy:(NSString *)name;
+(NSDictionary *) integerBy:(NSString *)name defaultValue:(NSNumber *)defaultV;
+(NSDictionary *) integerBoundedBy:(NSString *)name \
    min:(NSNumber *)min max:(NSNumber *)max defaultValue:(NSNumber *)defaultV;
+(NSDictionary *) doubleBy:(NSString *)name defaultValue:(NSNumber *)defaultV;
+(NSDictionary *) doubleBoundedBy:(NSString *)name \
    min:(NSNumber *)min max:(NSNumber *)max defaultValue:(NSNumber *)defaultV;
+(NSDictionary *) selectSingleBy:(NSString *)name \
    choices:(NSArray *)choices defaultValue:(NSNumber *)defaultV;
+(NSDictionary *) selectMultipleBy:(NSString *)name choices:(NSArray *)choices;
+(NSNumber *) checoboxSingleBy:(NSString *)name;
+(NSDictionary *) checkboxMultipleBy:(NSString *)name choices:(NSArray *)choices;
+(NSDictionary *) radioBy:(NSString *)name \
    values:(NSArray *)values defaultValue:(NSNumber *)defaultV;
@end