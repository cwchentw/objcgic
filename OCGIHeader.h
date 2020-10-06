#pragma once

#include "cgic.h"

#import <Foundation/Foundation.h>
#import "OCGIHTTPStatus.h"


@interface OCGIHeader : NSObject {
    /* No instance field. */
}

+(void) location: (NSString *)redirectUrl;
+(void) status: (NSNumber *)status message: (NSString *)statusMessage;
+(void) contentType: (NSString *)mimeType;

+(void) ok;
+(void) notFound;
+(void) internalServerError;
+(void) forbidden;
@end
