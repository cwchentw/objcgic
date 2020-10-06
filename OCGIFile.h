#pragma once

#include "cgic.h"

#import <Foundation/Foundation.h>


@interface OCGIFile : NSObject {
@private
    cgiFilePtr file;
}

+(NSDictionary *) nameBy: (NSString *)name length: (NSNumber *)max;
+(NSDictionary *) contentTypeBy: (NSString *)name length: (NSNumber *)max;
+(NSDictionary *) fileSizeBy: (NSString *)name;
-(NSDictionary *) open: (NSString *)name;
@end