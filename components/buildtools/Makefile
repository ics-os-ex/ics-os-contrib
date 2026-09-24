# Standalone ics-os-contrib defaults (override ICSOS_ROOT / SRC_ROOT as needed).
ICSOS_ROOT     ?= $(abspath $(CURDIR)/../../../ics-os/ics-os)
SRC_ROOT       ?= $(abspath $(CURDIR)/../../sources)
COMPONENT_ROOT ?= $(abspath $(CURDIR)/../..)
STAGE_MAKE     ?= $(abspath $(CURDIR)/../../scripts/stage-make.sh)
include $(ICSOS_ROOT)/sdk/app.mk

.DEFAULT_GOAL := all

CC=gcc
SDK=$(ICSOS_ROOT)/sdk
# ICSOS_ROOT: provided by the standalone header above
CFLAGS=$(APP_CFLAGS) -nostdinc -I$(SDK)/include
LIBS=$(SDK)/tccsdk.c $(SDK)/posix.c $(SDK)/libtcc1.c $(SDK)/crt1.c $(SDK)/setjmp.c
TOOLS=cp.exe mkdir.exe rm.exe

buildtool.exe: buildtool.c
	$(CC) $(CFLAGS) $(APP_LDFLAGS) -o$@ buildtool.c $(LIBS)

$(TOOLS): buildtool.exe
	cp buildtool.exe $@

all: $(TOOLS)

buildtest.exe: buildtest.c
	$(CC) $(CFLAGS) $(APP_LDFLAGS) -o$@ buildtest.c $(LIBS)

install: all buildtest.exe
	mkdir -p $(ICSOS_ROOT)/apps
	cp $(TOOLS) buildtest.exe $(ICSOS_ROOT)/apps/

clean:
	rm -f buildtool.exe buildtest.exe $(TOOLS)

.PHONY: all install clean
