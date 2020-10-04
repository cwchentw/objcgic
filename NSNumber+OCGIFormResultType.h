#pragma once
#import "OCGIFormResultType.h"

@interface NSNumber (OCGIFormResultType)
+(NSNumber *) numberWithOCGIFormType: (OCGIFormResultType)type;
-(NSNumber *) initWithOCGIFormType: (OCGIFormResultType)type;
-(OCGIFormResultType) ocgiFormType;
@end