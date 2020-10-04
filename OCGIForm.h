#pragma once

#import <Foundation/Foundation.h>
#include "cgic.h"

#define  OCGI_FORM_RESULT_TYPE  cgiFormResultType

#define  OCGI_FORM_SUCCESS          cgiFormSuccess
#define  OCGI_FORM_TRUNCATED        cgiFormTruncated
#define  OCGI_FORM_BAD_TYPE         cgiFormBadType
#define  OCGI_FORM_EMPTY            cgiFormEmpty
#define  OCGI_FORM_NOT_FOUND        cgiFormNotFound
#define  OCGI_FORM_CONSTRAINED      cgiFormConstrained
#define  OCGI_FORM_NO_SUCH_CHOICE   cgiFormNoSuchChoice
#define  OCGI_FORM_MEMORY           cgiFormMemory
#define  OCGI_FORM_NO_FILE_NAME     cgiFormNoFileName
#define  OCGI_FORM_NO_CONTENT_TYPE  cgiFormNoContentType
#define  OCGI_FORM_NOT_A_FILE       cgiFormNotAFile
#define  OCGI_FORM_OPEN_FAILED      cgiFormOpenFailed
#define  OCGI_FORM_IO               cgiFormIO
#define  OCGI_FORM_EOF              cgiFormEOF

@interface OCGIForm : NSObject {
    /* No instance field. */
}

+(NSDictionary *) stringBy: (NSString *)name length: (NSNumber *)max;
+(NSDictionary *) stringNoNewlinesBy: (NSString *)name length: (NSNumber *)max;
@end