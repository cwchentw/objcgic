# Detect system OS.
ifeq ($(OS),Windows_NT)
    detected_OS := Windows
else
    detected_OS := $(shell sh -c 'uname -s 2>/dev/null || echo not')
endif

# Set the include path of GNUstep.
GNUSTEP_INCLUDE=
ifeq (,$(GNUSTEP_INCLUDE))
	GNUSTEP_INCLUDE=/usr/GNUstep/System/Library/Headers
endif

# Set the library path of GNUstep.
GNUSTEP_LIB=
ifeq (,$(GNUSTEP_LIB))
	GNUSTEP_LIB=/usr/GNUstep/System/Library/Libraries
endif

# Set the file name of target CGI script.
CGI_PROGRAM=
ifeq (,$(CGI_PROGRAM))
ifeq ($(detected_OS),Windows)
	CGI_PROGRAM=index.exe
else
	CGI_PROGRAM=index.cgi
endif
endif

OBJS=OCGIHeader.o OCGICookie.o NSNumber+OCGIFormResultType.o OCGIForm.o \
	OCGISanitizer.o OCGIMain.o


.PHONY: all clean

all: cgi

cgi: cgic.o $(OBJS)
ifeq ($(detected_OS),Darwin)
	$(CC) -o $(CGI_PROGRAM) cgic.o $(OBJS) -lobjc -framework Foundation
else
	$(CC) -o $(CGI_PROGRAM) cgic.o $(OBJS) -lobjc -lgnustep-base -L $(GNUSTEP_LIB)
endif

%.o:%.c
	$(CC) -std=c89 -c $< -o $@ $(CFLAGS)

%.o:%.m
ifeq ($(detected_OS),Darwin)
	$(CC) -std=c17 -c $< -o $@ $(CFLAGS) -fconstant-string-class=NSConstantString
else
	$(CC) -std=c17 -c $< -o $@ $(CFLAGS) -I $(GNUSTEP_INCLUDE) -fconstant-string-class=NSConstantString
endif

clean:
	$(RM) $(CGI_PROGRAM) cgic.o $(OBJS)
