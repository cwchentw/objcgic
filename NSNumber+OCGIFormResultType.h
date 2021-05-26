#pragma once

#import "OCGIFormResultType.h"

@interface NSNumber (OCGIFormResultType)
+(instancetype) numberWithOCGIFormResultType:(OCGIFormResultType)type;
-(instancetype) initWithOCGIFormResultType:(OCGIFormResultType)type;
-(OCGIFormResultType) ocgiFormResultType;
@end