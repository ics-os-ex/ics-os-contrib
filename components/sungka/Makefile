# Standalone ics-os-contrib defaults (override ICSOS_ROOT / SRC_ROOT as needed).
ICSOS_ROOT     ?= $(abspath $(CURDIR)/../../../ics-os/ics-os)
SRC_ROOT       ?= $(abspath $(CURDIR)/../../sources)
COMPONENT_ROOT ?= $(abspath $(CURDIR)/../..)
STAGE_MAKE     ?= $(abspath $(CURDIR)/../../scripts/stage-make.sh)
include $(ICSOS_ROOT)/sdk/app.mk

CC=gcc
# ICSOS_ROOT: provided by the standalone header above
SDK=$(ICSOS_ROOT)/sdk
CFLAGS=$(APP_CFLAGS) -nostdinc -I$(SDK)/include -I$(ICSOS_ROOT)
LIBS=$(SDK)/tccsdk.c $(SDK)/posix.c $(SDK)/setjmp.c $(SDK)/libtcc1.c $(SDK)/crt1.c
EXE=sungka.exe

$(EXE): sungka.c
	$(CC)  $(CFLAGS) $(APP_LDFLAGS) -o${EXE} sungka.c $(LIBS)

install: $(EXE)
	mkdir -p $(ICSOS_ROOT)/apps
	cp $(EXE) $(ICSOS_ROOT)/apps

uninstall:
	rm -f $(ICSOS_ROOT)/apps/$(EXE)

clean:
	rm -f $(EXE)
