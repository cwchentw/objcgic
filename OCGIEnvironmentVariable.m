#import "OCGIEnvironmentVariable.h"

@implementation OCGIEnvironmentVariable
+(OCGIEnvironmentResultType) writeBy: (NSString *)filename
{
    return cgiWriteEnvironment((char *)[filename cString]);
}

+(OCGIEnvironmentResultType) readBy: (NSString *)filename;
{
    return cgiReadEnvironment((char *)[filename cString]);
}
@end