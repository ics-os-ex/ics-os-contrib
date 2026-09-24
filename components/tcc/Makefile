# Standalone ics-os-contrib defaults (override ICSOS_ROOT / SRC_ROOT as needed).
ICSOS_ROOT     ?= $(abspath $(CURDIR)/../../../ics-os/ics-os)
SRC_ROOT       ?= $(abspath $(CURDIR)/../../sources)
COMPONENT_ROOT ?= $(abspath $(CURDIR)/../..)
STAGE_MAKE     ?= $(abspath $(CURDIR)/../../scripts/stage-make.sh)
include $(ICSOS_ROOT)/sdk/app.mk

# Build TinyCC as an ICS-OS ELF64 executable (x86_64 codegen) using host gcc + dexsdk.
NAME=tcc
EXE=$(NAME).exe
# ICSOS_ROOT: provided by the standalone header above
SDK=$(ICSOS_ROOT)/sdk
TCC_SRC=.

override CFLAGS := $(APP_CFLAGS) \
	-nostdinc -I$(SDK)/include -I$(TCC_SRC) \
	-DTCC_TARGET_X86_64 -DONE_SOURCE -DCONFIG_TCC_STATIC
LIBS := $(SDK)/tccsdk.c $(SDK)/posix.c $(SDK)/libtcc1.c $(SDK)/crt1.c $(SDK)/setjmp.c

$(EXE): tcc.c tcc.h config.h libtcc.c tccelf.c tccpp.c tccgen.c tccasm.c tccrun.c \
		x86_64-gen.c x86_64-link.c x86_64-asm.h i386-asm.c \
		$(SDK)/posix.c $(SDK)/tccsdk.c $(SDK)/crt1.c $(SDK)/setjmp.c \
		$(SDK)/libtcc1.c
	$(CC) $(CFLAGS) $(APP_LDFLAGS) -Wl,-s -o$(EXE) tcc.c $(LIBS)

install: $(EXE)
	mkdir -p $(ICSOS_ROOT)/apps
	cp $(EXE) $(ICSOS_ROOT)/apps

clean:
	rm -f $(EXE)

.PHONY: install clean
