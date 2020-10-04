#pragma once

#import <Foundation/Foundation.h>
#include "cgic.h"

#define  OCGIFormResultType cgiFormResultType

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

@protocol OCGIFormResultType
+(NSNumber *) numberWithOCGIFormResultType: (OCGIFormResultType)type;
-(NSNumber *) initWithOCGIFormResultType: (OCGIFormResultType)type;
-(OCGIFormResultType) ocgiFormResultType;
@end
