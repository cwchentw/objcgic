#import <Foundation/Foundation.h>
#import "OCGIHeader.h"

@implementation OCGIHeader
+(void) location: (NSString *)redirectUrl
{
    cgiHeaderLocation((char *)[redirectUrl cString]);
}
@end