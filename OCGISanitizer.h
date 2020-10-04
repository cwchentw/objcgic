#pragma once

#import <Foundation/Foundation.h>
#import "OCGIForm.h"

@interface OCGISanitizer : NSObject {
    /* No instance field. */
}

+(OCGI_FORM_RESULT_TYPE) escapeHTML: (NSString *)s;
@end