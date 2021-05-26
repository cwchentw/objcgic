#pragma once

#include "cgic.h"

#import <Foundation/Foundation.h>
#import "OCGIEnvironmentResultType.h"

/* CGI request meta-variables. */
#define  OCGI_AUTH_TYPE          [NSString stringWithCString:cgiAuthType encoding:NSUTF8StringEncoding]
#define  OCGI_CONTENT_LENGTH     [NSNumber numberWithInt:cgiContentLength]
#define  OCGI_CONTENT_TYPE       [NSString stringWithCString:cgiContentType encoding:NSUTF8StringEncoding]
#define  OCGI_GATEWAY_INTERFACE  [NSString stringWithCString:cgiGatewayInterface encoding:NSUTF8StringEncoding]
#define  OCGI_PATH_INFO          [NSString stringWithCString:cgiPathInfo encoding:NSUTF8StringEncoding]
#define  OCGI_PATH_TRANSLATED    [NSString stringWithCString:cgiPathTranslated encoding:NSUTF8StringEncoding]
#define  OCGI_QUERY_STRING       [NSString stringWithCString:cgiQueryString encoding:NSUTF8StringEncoding]
#define  OCGI_REMOTE_ADDR        [NSString stringWithCString:cgiRemoteAddr encoding:NSUTF8StringEncoding]
#define  OCGI_REMOTE_HOST        [NSString stringWithCString:cgiRemoteHost encoding:NSUTF8StringEncoding]
#define  OCGI_REMOTE_IDENT       [NSString stringWithCString:cgiRemoteIdent encoding:NSUTF8StringEncoding]
#define  OCGI_REMOTE_USER        [NSString stringWithCString:cgiRemoteUser encoding:NSUTF8StringEncoding]
#define  OCGI_REQUEST_METHOD     [NSString stringWithCString:cgiRequestMethod encoding:NSUTF8StringEncoding]
#define  OCGI_SCRIPT_NAME        [NSString stringWithCString:cgiScriptName encoding:NSUTF8StringEncoding]
#define  OCGI_SERVER_NAME        [NSString stringWithCString:cgiServerName encoding:NSUTF8StringEncoding]
#define  OCGI_SERVER_PORT        [NSString stringWithCString:cgiServerPort encoding:NSUTF8StringEncoding]
#define  OCGI_SERVER_PROTOCOL    [NSString stringWithCString:cgiServerProtocol encoding:NSUTF8StringEncoding]
#define  OCGI_SERVER_SOFTWARE    [NSString stringWithCString:cgiServerSoftware encoding:NSUTF8StringEncoding]

/* cgic extra variables. */
#define  OCGI_ACCEPT      [NSString stringWithCString:cgiAccept encoding:NSUTF8StringEncoding]
#define  OCGI_USER_AGENT  [NSString stringWithCString:cgiUserAgent encoding:NSUTF8StringEncoding]
#define  OCGI_REFERRER    [NSString stringWithCString:cgiReferrer encoding:NSUTF8StringEncoding]
#define  OCGI_REFERER     OCGI_REFERRER


@interface OCGIEnvironmentVariable : NSObject {
    /* No instance field. */
}

+(OCGIEnvironmentResultType) writeBy:(NSString *)filename;
+(OCGIEnvironmentResultType) readBy:(NSString *)filename;
@end