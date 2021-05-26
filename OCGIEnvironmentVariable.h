#pragma once

#include "cgic.h"

#import <Foundation/Foundation.h>
#import "OCGIEncoding.h"
#import "OCGIEnvironmentResultType.h"

/* CGI request meta-variables. */
#define  OCGI_AUTH_TYPE          [NSString stringWithCString:cgiAuthType encoding:OCGI_ENCODING]
#define  OCGI_CONTENT_LENGTH     [NSNumber numberWithInt:cgiContentLength]
#define  OCGI_CONTENT_TYPE       [NSString stringWithCString:cgiContentType encoding:OCGI_ENCODING]
#define  OCGI_GATEWAY_INTERFACE  [NSString stringWithCString:cgiGatewayInterface encoding:OCGI_ENCODING]
#define  OCGI_PATH_INFO          [NSString stringWithCString:cgiPathInfo encoding:OCGI_ENCODING]
#define  OCGI_PATH_TRANSLATED    [NSString stringWithCString:cgiPathTranslated encoding:OCGI_ENCODING]
#define  OCGI_QUERY_STRING       [NSString stringWithCString:cgiQueryString encoding:OCGI_ENCODING]
#define  OCGI_REMOTE_ADDR        [NSString stringWithCString:cgiRemoteAddr encoding:OCGI_ENCODING]
#define  OCGI_REMOTE_HOST        [NSString stringWithCString:cgiRemoteHost encoding:OCGI_ENCODING]
#define  OCGI_REMOTE_IDENT       [NSString stringWithCString:cgiRemoteIdent encoding:OCGI_ENCODING]
#define  OCGI_REMOTE_USER        [NSString stringWithCString:cgiRemoteUser encoding:OCGI_ENCODING]
#define  OCGI_REQUEST_METHOD     [NSString stringWithCString:cgiRequestMethod encoding:OCGI_ENCODING]
#define  OCGI_SCRIPT_NAME        [NSString stringWithCString:cgiScriptName encoding:OCGI_ENCODING]
#define  OCGI_SERVER_NAME        [NSString stringWithCString:cgiServerName encoding:OCGI_ENCODING]
#define  OCGI_SERVER_PORT        [NSString stringWithCString:cgiServerPort encoding:OCGI_ENCODING]
#define  OCGI_SERVER_PROTOCOL    [NSString stringWithCString:cgiServerProtocol encoding:OCGI_ENCODING]
#define  OCGI_SERVER_SOFTWARE    [NSString stringWithCString:cgiServerSoftware encoding:OCGI_ENCODING]

/* cgic extra variables. */
#define  OCGI_ACCEPT      [NSString stringWithCString:cgiAccept encoding:OCGI_ENCODING]
#define  OCGI_USER_AGENT  [NSString stringWithCString:cgiUserAgent encoding:OCGI_ENCODING]
#define  OCGI_REFERRER    [NSString stringWithCString:cgiReferrer encoding:OCGI_ENCODING]
#define  OCGI_REFERER     OCGI_REFERRER


@interface OCGIEnvironmentVariable : NSObject {
    /* No instance field. */
}

+(OCGIEnvironmentResultType) writeBy:(NSString *)filename;
+(OCGIEnvironmentResultType) readBy:(NSString *)filename;
@end