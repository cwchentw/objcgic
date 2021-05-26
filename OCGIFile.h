#pragma once

#include "cgic.h"

#import <Foundation/Foundation.h>
#import "OCGIFormResultType.h"

@interface OCGIFile : NSObject {
@private
    cgiFilePtr file;
}

+(NSDictionary *) nameBy:(NSString *)name length:(NSNumber *)max;
+(NSDictionary *) contentTypeBy:(NSString *)name length:(NSNumber *)max;
+(NSDictionary *) fileSizeBy:(NSString *)name;
-(NSDictionary *) open:(NSString *)name;
-(OCGIFormResultType) close;
-(NSDictionary *) readWithSize:(NSNumber *)bufferSize;
@end