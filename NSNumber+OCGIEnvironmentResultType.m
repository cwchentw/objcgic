#import <Foundation/Foundation.h>
#import "OCGIEnvironmentResultType.h"


@implementation NSNumber (OCGIEnvironmentResultType)
+(instancetype) numberWithOCGIEnvironmentResultType:(OCGIEnvironmentResultType)type
{
    return [NSNumber numberWithInt:type];
}

-(instancetype) initWithOCGIEnvironmentResultType:(OCGIEnvironmentResultType)type
{
    return [self initWithInt:type];
}

-(OCGIEnvironmentResultType) ocgiEnvironmentResultType
{
    return (OCGIEnvironmentResultType) [self intValue];
}
@end