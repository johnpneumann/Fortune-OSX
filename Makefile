#
# MacOS X Makefile for fortune
# This fortune source was taken from FreeBSD-current on July 10, 1999
# Go to ftp://ftp.freebsd.org/pub/FreeBSD/ to get the original sources
#
#  Chris Saldanha <csaldanh@acm.org>
#  July 12, 1999
#
#
# This file customized for MacOS X with install and remove options.
# Also cleaned up fortune.c and regex.c to get rid of some warnings.
#
#  Scott Lahteine <scott@thinkyhead.com>
#  November 17, 2006
#
#  Updated the Makefile to force a 32-bit build on 64 bit systems
#  November 24, 2009
#
#  Updated the Makefile and the fortune.c file to allow users to specify
#  files to choose fortune from (eg fortune kids) and so that it correctly
#  output the contents of fortune -f
#  May 6, 2011
#
# [See README.ORIG for the original README included with fortune.]
#

GAMEPATH = /usr/local/bin
DATAPATH = /usr/local/var
TRUEDATAPATH = /usr/local/var/fortunes

MANPATH = /usr/local/share/man
CFLAGS = -Os -pipe
LDFLAGS =
OBJS =

all: fortune strfile unstr

prepare:
	mkdir -p work

regexpr: prepare
	$(CC) -c $(CFLAGS) $(LDFLAGS) regexpr.c

fortune: prepare regexpr.o
	@echo "#define FORTDIR \"$(DATAPATH)\"\n#define TRUEFORTDIR \"$(TRUEDATAPATH)\"" >pathnames.h
	$(CC) $(CFLAGS) $(LDFLAGS) -o work/fortune fortune.c regexpr.o

strfile: prepare
	$(CC) $(CFLAGS) $(LDFLAGS) -o work/strfile strfile.c 

unstr: prepare
	$(CC) $(CFLAGS) $(LDFLAGS) -o work/unstr unstr.c

clean:
	rm -rf package work *.o
	@echo "Cleaned"

install:
	@echo "Installing..."

	mkdir -p $(GAMEPATH)
	mkdir -p $(DATAPATH)
	mkdir -p $(MANPATH)/man6
	mkdir -p $(MANPATH)/man8

	cp work/* $(GAMEPATH)/
	cp -r fortunes $(DATAPATH)/
	cp fortune.6 $(MANPATH)/man6/
	cp strfile.8 $(MANPATH)/man8/

package: all
	@echo -n "Making local install package..."

	@mkdir -p package/bin
	@mkdir -p package/var
	@mkdir -p package/share/man/man6
	@mkdir -p package/share/man/man8

	@cp work/*		package/bin/
	@cp -R fortunes	package/var/
	@cp fortune.6	package/share/man/man6
	@cp strfile.8	package/share/man/man8

	@echo " Done."

uninstall: remove
remove:
	@echo "Uninstalling fortune..."
	@if [ -f $(GAMEPATH)/fortune ]; then rm $(GAMEPATH)/fortune; fi
	@if [ -f $(GAMEPATH)/strfile ]; then rm $(GAMEPATH)/strfile; fi
	@if [ -f $(GAMEPATH)/unstr ]; then rm $(GAMEPATH)/unstr; fi
	@if [ -d $(DATAPATH)/fortunes ]; then rm -r $(DATAPATH)/fortunes; fi
	@if [ -f $(MANPATH)/man6/fortune.6 ]; then rm $(MANPATH)/man6/fortune.6; fi
	@if [ -f $(MANPATH)/man8/strfile.8 ]; then rm $(MANPATH)/man8/strfile.8; fi
