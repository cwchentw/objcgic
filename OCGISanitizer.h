#pragma once

#import <Foundation/Foundation.h>
#import "OCGIFormResultType.h"
#import "OCGIForm.h"

@interface OCGISanitizer : NSObject {
    /* No instance field. */
}

+(OCGIFormResultType) escapeHTML: (NSString *)s;
+(OCGIFormResultType) escapeHTML: (NSString *)data length: (NSNumber *)len;
+(OCGIFormResultType) escapeValue: (NSString *)s;
+(OCGIFormResultType) eacapeValue: (NSString *)data length: (NSNumber *)len;
@end