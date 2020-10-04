#import <Foundation/Foundation.h>
#import "NSNumber+OCGIFormResultType.h"

@implementation NSNumber (OCGIFormResultType)
+(NSNumber *) numberWithOCGIFormResultType: (OCGIFormResultType)type
{
    return [NSNumber numberWithInt: type];
}

-(NSNumber *) initWithOCGIFormResultType: (OCGIFormResultType)type
{
    return [self initWithInt: type];
}

-(OCGIFormResultType) ocgiFormResultType
{
    return (OCGIFormResultType) [self intValue];
}
@end