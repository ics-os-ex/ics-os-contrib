# Standalone ics-os-contrib defaults (override ICSOS_ROOT / SRC_ROOT as needed).
ICSOS_ROOT     ?= $(abspath $(CURDIR)/../../../ics-os/ics-os)
SRC_ROOT       ?= $(abspath $(CURDIR)/../../sources)
COMPONENT_ROOT ?= $(abspath $(CURDIR)/../..)
STAGE_MAKE     ?= $(abspath $(CURDIR)/../../scripts/stage-make.sh)
include $(ICSOS_ROOT)/sdk/app.mk

CC=gcc
SDK=$(ICSOS_ROOT)/sdk
EXE=gccboot.exe
SRC=gccboot.c
CFLAGS=$(APP_CFLAGS) -nostdinc -I$(SDK)/include
LIBS=$(SDK)/tccsdk.c $(SDK)/posix.c $(SDK)/libtcc1.c $(SDK)/crt1.c

$(EXE): $(SRC)
	$(CC) $(CFLAGS) $(APP_LDFLAGS) -o $@ $(SRC) $(LIBS)

install: $(EXE)
	mkdir -p $(ICSOS_ROOT)/apps
	cp $(EXE) $(ICSOS_ROOT)/apps/$(EXE)

clean:
	rm -f $(EXE)
