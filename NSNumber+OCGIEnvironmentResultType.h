#pragma once

#import "OCGIEnvironmentResultType.h"

@interface NSNumber (OCGIEnvironmentResultType)
+(instancetype) numberWithOCGIEnvironmentResultType:(OCGIEnvironmentResultType)type;
-(instancetype) initWithOCGIEnvironmentResultType:(OCGIEnvironmentResultType)type;
-(OCGIEnvironmentResultType) ocgiEnvironmentResultType;
@end