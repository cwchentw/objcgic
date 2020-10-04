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

+(NSDictionary *) by: (NSString *)name length: (NSNumber *)max;
+(NSDictionary *) by: (NSString *)name defaultValue: (NSNumber *)defaultV;
+(void) setBy: (NSString *)name to: (NSString *)value \
    toLive: (NSNumber *)secondsToLive \
    path: (NSString *)path domain: (NSString *)domain \
    options: (OCGI_COOKIE_OPTIONS)options;
+(void) setBy: (NSString *)name to: (NSString *)value \
    toLive: (NSNumber *)secondsToLive \
    path: (NSString *)path domain: (NSString *)domain;
+(void) setBy: (NSString *)name toInteger: (NSNumber *)value \
    toLive: (NSNumber *)secondsToLive \
    path: (NSString *)path domain: (NSString *)domain;
@end
