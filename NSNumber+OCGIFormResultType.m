#import <Foundation/Foundation.h>
#import "NSNumber+OCGIFormResultType.h"

@implementation NSNumber (OCGIFormResultType)
+(NSNumber *) numberWithOCGIFormType: (OCGIFormResultType)type
{
    return [NSNumber numberWithInt: type];
}

-(NSNumber *) initWithOCGIFormType: (OCGIFormResultType)type
{
    return [self initWithInt: type];
}

-(OCGIFormResultType) ocgiFormType
{
    return (OCGIFormResultType) [self intValue];
}
@end