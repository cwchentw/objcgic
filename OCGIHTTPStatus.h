#pragma once

/* Standard HTTP status messages.

   Ref: https://developer.mozilla.org/en-US/docs/Web/HTTP/Status
*/
#define  OCGI_HTTP_STATUS_100  @"Continue"
#define  OCGI_HTTP_STATUS_101  @"Switching Protocol"
#define  OCGI_HTTP_STATUS_102  @"Processing"
#define  OCGI_HTTP_STATUS_103  @"Early Hints"

#define  OCGI_HTTP_STATUS_200  @"OK"
#define  OCGI_HTTP_STATUS_201  @"Created"
#define  OCGI_HTTP_STATUS_202  @"Accepted"
#define  OCGI_HTTP_STATUS_203  @"Non-Authoritative Information"
#define  OCGI_HTTP_STATUS_204  @"No Content"
#define  OCGI_HTTP_STATUS_205  @"Reset Content"
#define  OCGI_HTTP_STATUS_206  @"Partial Content"
#define  OCGI_HTTP_STATUS_207  @"Multi-Status"
#define  OCGI_HTTP_STATUS_208  @"Already Reported"
#define  OCGI_HTTP_STATUS_226  @"IM Used"

#define  OCGI_HTTP_STATUS_300  @"Multiple Choice"
#define  OCGI_HTTP_STATUS_301  @"Moved Permanently"
#define  OCGI_HTTP_STATUS_302  @"Found"
#define  OCGI_HTTP_STATUS_303  @"See Other"
#define  OCGI_HTTP_STATUS_304  @"Not Modified"
#define  OCGI_HTTP_STATUS_305  @"Use Proxy"
#define  OCGI_HTTP_STATUS_307  @"Temporary Redirect"
#define  OCGI_HTTP_STATUS_308  @"Permanent Redirect"

#define  OCGI_HTTP_STATUS_400  @"Bad Request"
#define  OCGI_HTTP_STATUS_401  @"Unauthorized"
#define  OCGI_HTTP_STATUS_402  @"Payment Required"
#define  OCGI_HTTP_STATUS_403  @"Forbidden"
#define  OCGI_HTTP_STATUS_404  @"Not Found"
#define  OCGI_HTTP_STATUS_405  @"Method Not Allowed"
#define  OCGI_HTTP_STATUS_406  @"Not Acceptable"
#define  OCGI_HTTP_STATUS_407  @"Proxy Authentication Required"
#define  OCGI_HTTP_STATUS_408  @"Request Timeout"
#define  OCGI_HTTP_STATUS_409  @"Conflict"
#define  OCGI_HTTP_STATUS_410  @"Gone"
#define  OCGI_HTTP_STATUS_411  @"Length Required"
#define  OCGI_HTTP_STATUS_412  @"Precondition Failed"
#define  OCGI_HTTP_STATUS_413  @"Payload Too Large"
#define  OCGI_HTTP_STATUS_414  @"URI Too Long"
#define  OCGI_HTTP_STATUS_415  @"Unsupported Media Type"
#define  OCGI_HTTP_STATUS_416  @"Range Not Satisfiable"
#define  OCGI_HTTP_STATUS_417  @"Expectation Failed"
#define  OCGI_HTTP_STATUS_418  @"I'm a teapot"
#define  OCGI_HTTP_STATUS_421  @"Misdirected Request"
#define  OCGI_HTTP_STATUS_422  @"Unprocessable Entity"
#define  OCGI_HTTP_STATUS_423  @"Locked"
#define  OCGI_HTTP_STATUS_424  @"Failed Dependency"
#define  OCGI_HTTP_STATUS_425  @"Too Early"
#define  OCGI_HTTP_STATUS_426  @"Upgrade Required"
#define  OCGI_HTTP_STATUS_428  @"Precondition Required"
#define  OCGI_HTTP_STATUS_429  @"Too Many Requests"
#define  OCGI_HTTP_STATUS_431  @"Request Header Fields Too Large"
#define  OCGI_HTTP_STATUS_451  @"Unavailable For Legal Reasons"

#define  OCGI_HTTP_STATUS_500  @"Internal Server Error"
#define  OCGI_HTTP_STATUS_501  @"Not Implemented"
#define  OCGI_HTTP_STATUS_502  @"Bad Gateway"
#define  OCGI_HTTP_STATUS_503  @"Service Unavailable"
#define  OCGI_HTTP_STATUS_504  @"Gateway Timeout"
#define  OCGI_HTTP_STATUS_505  @"HTTP Version Not Supported"
#define  OCGI_HTTP_STATUS_506  @"Variant Also Negotiates"
#define  OCGI_HTTP_STATUS_507  @"Insufficient Storage"
#define  OCGI_HTTP_STATUS_508  @"Loop Detected"
#define  OCGI_HTTP_STATUS_510  @"Not Extended"
#define  OCGI_HTTP_STATUS_511  @"Network Authentication Required"