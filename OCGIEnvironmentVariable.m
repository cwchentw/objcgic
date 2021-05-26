#import "OCGIEnvironmentVariable.h"

@implementation OCGIEnvironmentVariable
+(OCGIEnvironmentResultType) writeBy:(NSString *)filename
{
    return cgiWriteEnvironment(
        (char *)[filename cStringUsingEncoding:NSUTF8StringEncoding]);
}

+(OCGIEnvironmentResultType) readBy:(NSString *)filename;
{
    return cgiReadEnvironment(
        (char *)[filename cStringUsingEncoding:NSUTF8StringEncoding]);
}
@end