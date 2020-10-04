#pragma once

#import <Foundation/Foundation.h>
#import "OCGIForm.h"

@interface OCGISanitizer : NSObject {
    /* No instance field. */
}

+(OCGI_FORM_RESULT_TYPE) escapeHTML: (NSString *)s;
+(OCGI_FORM_RESULT_TYPE) escapeHTML: (NSString *)data length: (NSNumber *)len;
+(OCGI_FORM_RESULT_TYPE) escapeValue: (NSString *)s;
+(OCGI_FORM_RESULT_TYPE) eacapeValue: (NSString *)data length: (NSNumber *)len;
@end