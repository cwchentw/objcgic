#pragma once

#include "cgic.h"

#import <Foundation/Foundation.h>


/* CGI request meta-variables. */
#define  OCGI_AUTH_TYPE          [NSString stringWithCString: cgiAuthType]
#define  OCGI_CONTENT_LENGTH     [NSNumber numberWithInt: cgiContentLength]
#define  OCGI_CONTENT_TYPE       [NSString stringWithCString: cgiContentType]
#define  OCGI_GATEWAY_INTERFACE  [NSString stringWithCString: cgiGatewayInterface]
#define  OCGI_PATH_INFO          [NSString stringWithCString: cgiPathInfo]
#define  OCGI_PATH_TRANSLATED    [NSString stringWithCString: cgiPathTranslated]
#define  OCGI_QUERY_STRING       [NSString stringWithCString: cgiQueryString]
#define  OCGI_REMOTE_ADDR        [NSString stringWithCString: cgiRemoteAddr]
#define  OCGI_REMOTE_HOST        [NSString stringWithCString: cgiRemoteHost]
#define  OCGI_REMOTE_IDENT       [NSString stringWithCString: cgiRemoteIdent]
#define  OCGI_REMOTE_USER        [NSString stringWithCString: cgiRemoteUser]
#define  OCGI_REQUEST_METHOD     [NSString stringWithCString: cgiRequestMethod]
#define  OCGI_SCRIPT_NAME        [NSString stringWithCString: cgiScriptName]
#define  OCGI_SERVER_NAME        [NSString stringWithCString: cgiServerName]
#define  OCGI_SERVER_PORT        [NSString stringWithCString: cgiServerPort]
#define  OCGI_SERVER_PROTOCOL    [NSString stringWithCString: cgiServerProtocol]
#define  OCGI_SERVER_SOFTWARE    [NSString stringWithCString: cgiServerSoftware]

/* cgic extra variables. */
#define  OCGI_ACCEPT      [NSString stringWithCString: cgiAccept]
#define  OCGI_USER_AGENT  [NSString stringWithCString: cgiUserAgent]
#define  OCGI_REFERRER    [NSString stringWithCString: cgiReferrer]
#define  OCGI_REFERER     OCGI_REFERRER
