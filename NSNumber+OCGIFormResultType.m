#import <Foundation/Foundation.h>
#import "NSNumber+OCGIFormResultType.h"


@implementation NSNumber (OCGIFormResultType)
+(instancetype) numberWithOCGIFormResultType: (OCGIFormResultType)type
{
    return [NSNumber numberWithInt: type];
}

-(instancetype) initWithOCGIFormResultType: (OCGIFormResultType)type
{
    return [self initWithInt: type];
}

-(OCGIFormResultType) ocgiFormResultType
{
    return (OCGIFormResultType) [self intValue];
}
@end