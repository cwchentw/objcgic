#pragma once

#include "cgic.h"

#import <Foundation/Foundation.h>

/* Alias to enum cgiCookieOption */
#define  OCGI_COOKIE_OPTIONS  cgiCookieOption

#define  OCGI_COOKIE_SECURE           cgiCookieSecure
#define  OCGI_COOKIE_HTTP_ONLY        cgiCookieHttpOnly
#define  OCGI_COOKIE_SAME_SITE_STRICT cgiCookieSameSiteStrict


@interface OCGICookie : NSObject {
    /* No instance field. */
}

+(NSDictionary *) stringBy: (NSString *)name length: (NSNumber *)max;
+(NSDictionary *) integerBy: (NSString *)name defaultValue: (NSNumber *)defaultV;
+(void) setStringBy: (NSString *)name to: (NSString *)value \
    toLive: (NSNumber *)secondsToLive \
    path: (NSString *)path domain: (NSString *)domain \
    options: (OCGI_COOKIE_OPTIONS)options;
+(void) setStringBy: (NSString *)name to: (NSString *)value \
    toLive: (NSNumber *)secondsToLive \
    path: (NSString *)path domain: (NSString *)domain;
+(void) setIntegerBy: (NSString *)name to: (NSNumber *)value \
    toLive: (NSNumber *)secondsToLive \
    path: (NSString *)path domain: (NSString *)domain;
@end
