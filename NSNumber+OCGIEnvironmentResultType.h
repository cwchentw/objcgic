#pragma once

#import <Foundation/Foundation.h>
#import "OCGIEnvironmentResultType.h"

@interface NSNumber (OCGIEnvironmentResultType)
+(NSNumber *) numberWithOCGIEnvironmentResultType: (OCGIEnvironmentResultType)type;
-(NSNumber *) initWithOCGIEnvironmentResultType: (OCGIEnvironmentResultType)type;
-(OCGIEnvironmentResultType) ocgiEnvironmentResultType;
@end