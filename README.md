# objcgic - A Objective-C binding of cgic

## Warning

objcgic is still experimental. Don't use it on production environment.

## System Requirements

* Clang or GCC
* GNUstep

It should work on Cocoa as well, though untested.

[cgic](https://github.com/boutell/cgic) itself is not needed because the repo bundles its snapshot.

## Usage

Clone the repo:

```
$ git clone https://github.com/cwchentw/objcgic.git
```

Implement your CGI script in *CGIMain.m*.

Compile the repo:

```
$ make CGI_PROGRAM=index.cgi
```

The default value of **CGI_PROGRAM** is *index.cgi* on non-Windows platforms but *index.exe* on Windows.

If your GNUstep is located on any location other than */usr/GNUstep*, set the include path and the library path of your local GNUstep:

```
$ make GNUSTEP_INCLUDE=/path/to/GNUstep/System/Library/Headers GNUSTEP_LIB=/path/to/GNUstep/System/Library/Libraries
```

The layout of your local GNUstep may vary. Adjust these variables accordingly.

If your build command becomes too long, consider to set these variables in [build](/build) and run it instead.

Because of the design of cgic, you have to use objcgic on the basis of one CGI script per repo.

If you want to save your own CGI script, push it remotely to a repo other than this one:

```
$ git remote set-url origin path/to/remote/git/repo.git
$ git push
```

## API Documentation

Pending.

## Note

The version of [cgic](https://github.com/boutell/cgic) snapshot in this repo is `2.08`.

## Copyright

Copyright (c) 2020, Michael Chen. Licensed under MIT, the same license as cgic itself.
