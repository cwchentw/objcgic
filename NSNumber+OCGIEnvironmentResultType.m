#import <Foundation/Foundation.h>
#import "OCGIEnvironmentResultType.h"


@implementation NSNumber (OCGIEnvironmentResultType)
+(NSNumber *) numberWithOCGIEnvironmentResultType: (OCGIEnvironmentResultType)type
{
    return [NSNumber numberWithInt: type];
}

-(NSNumber *) initWithOCGIEnvironmentResultType: (OCGIEnvironmentResultType)type
{
    return [self initWithInt: type];
}

-(OCGIEnvironmentResultType) ocgiEnvironmentResultType
{
    return (OCGIEnvironmentResultType) [self intValue];
}
@end