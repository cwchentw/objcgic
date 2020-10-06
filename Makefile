# Detect system OS.
ifeq ($(OS),Windows_NT)
    detected_OS := Windows
else
    detected_OS := $(shell sh -c 'uname -s 2>/dev/null || echo not')
endif

# Set the include path of GNUstep.
ifeq (,$(GNUSTEP_INCLUDE))
	GNUSTEP_INCLUDE=/usr/GNUstep/System/Library/Headers
endif

# Set the library path of GNUstep.
ifeq (,$(GNUSTEP_LIB))
	GNUSTEP_LIB=/usr/GNUstep/System/Library/Libraries
endif

GCC_LIB=$(shell sh -c 'dirname `gcc -print-prog-name=cc1 /dev/null`')

# Set the file name of target CGI script.
ifeq (,$(CGI_PROGRAM))
ifeq ($(detected_OS),Windows)
	CGI_PROGRAM=index.exe
else
	CGI_PROGRAM=index.cgi
endif
endif

OBJS=NSArray+RawArray.o NSNumber+OCGIFormResultType.o \
	OCGIHeader.o OCGICookie.o OCGIForm.o OCGIFile.o OCGISanitizer.o OCGIMain.o


# Set the include path of libobjc on non-Apple platforms.
OBJC_INCLUDE := -I $(GCC_LIB)/include

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
	$(CC) -std=c11 -c $< -o $@ $(CFLAGS) -fconstant-string-class=NSConstantString
else
	$(CC) -std=c11 -c $< -o $@ $(CFLAGS) $(OBJC_INCLUDE) -I $(GNUSTEP_INCLUDE) -fconstant-string-class=NSConstantString
endif

clean:
	$(RM) $(CGI_PROGRAM) cgic.o $(OBJS)
