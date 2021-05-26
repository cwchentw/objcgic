#import "OCGIEnvironmentVariable.h"

@implementation OCGIEnvironmentVariable
+(OCGIEnvironmentResultType) writeBy:(NSString *)filename
{
    return cgiWriteEnvironment(
        (char *)[filename cStringUsingEncoding:OCGI_ENCODING]);
}

+(OCGIEnvironmentResultType) readBy:(NSString *)filename;
{
    return cgiReadEnvironment(
        (char *)[filename cStringUsingEncoding:OCGI_ENCODING]);
}
@end