#pragma once
#import "OCGIFormResultType.h"

@interface NSNumber (OCGIFormResultType)
+(NSNumber *) numberWithOCGIFormResultType: (OCGIFormResultType)type;
-(NSNumber *) initWithOCGIFormResultType: (OCGIFormResultType)type;
-(OCGIFormResultType) ocgiFormResultType;
@end