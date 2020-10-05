#pragma once

#include "cgic.h"

#import <Foundation/Foundation.h>


@interface OCGIHeader : NSObject {
    /* No instance field. */
}

+(void) location: (NSString *)redirectUrl;
+(void) status: (NSNumber *)status message: (NSString *)statusMessage;
+(void) contentType: (NSString *)mimeType;
@end
