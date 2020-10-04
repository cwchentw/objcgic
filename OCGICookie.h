#pragma once

#import <Foundation/Foundation.h>
#include "cgic.h"

/* Alias to enum cgiCookieOption */
#define  OCGI_COOKIE_OPTIONS  cgiCookieOption

#define  OCGI_COOKIE_SECURE           cgiCookieSecure
#define  OCGI_COOKIE_HTTP_ONLY        cgiCookieHttpOnly
#define  OCGI_COOKIE_SAME_SITE_STRICT cgiCookieSameSiteStrict

@interface OCGICookie : NSObject {
    /* No instance field. */
}

+(NSDictionary *) stringByName: (NSString *)name length: (NSNumber *)max;
+(NSDictionary *) integerByName: (NSString *)name defaultValue: (NSNumber *)defaultV;
+(void) setByName: (NSString *)name to: (NSString *)value \
    toLive: (NSNumber *)secondsToLive \
    path: (NSString *)path domain: (NSString *)domain \
    options: (OCGI_COOKIE_OPTIONS)options;
@end
