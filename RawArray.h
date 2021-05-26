#pragma once

#import <Foundation/Foundation.h>


@protocol RawArray
-(char **) cStringArrayUsingEncoding:(NSStringEncoding)encoding;
@end