#pragma once

#include "cgic.h"

#import <Foundation/Foundation.h>
#import "OCGIEnvironmentResultType.h"

#define OCGIEnvironmentResultType cgiEnvironmentResultType

#define OCGI_ENVIRONMENT_IO             cgiEnvironmentIO
#define OCGI_ENVIRONMENT_MEMORY         cgiEnvironmentMemory
#define OCGI_ENVIRONMENT_SUCCESS        cgiEnvironmentSuccess
#define OCGI_ENVIRONMENT_WRONG_VERSION  cgiEnvironmentWrongVersion


@protocol OCGIEnvironmentResultType
+(NSNumber *) numberWithOCGIEnvironmentResultType:(OCGIEnvironmentResultType)type;
-(NSNumber *) initWithOCGIEnvironmentResultType:(OCGIEnvironmentResultType)type;
-(OCGIEnvironmentResultType) ocgiEnvironmentResultType;
@end