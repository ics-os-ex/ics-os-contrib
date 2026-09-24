# Top-level convenience Makefile for ics-os-contrib.
#
# Individual components can be built directly:
#   make -C components/hello
#   make hello          # equivalent, via the pattern target below
#
# Upstream/reference sources are pinned as tarballs under sources/ and extracted
# on demand by scripts/extract.sh.

COMPONENTS := $(notdir $(wildcard components/*/Makefile))
BUILD_ORDER := gmp mpfr mpc binutils gnumake tcc gcc nethack vim \
                hello nc netecho telnetd ifconfig route sh httpd netbench \
                netstress posixio ext4test fatwr forktest spawntest stressproc \
                duptest apuser asloop bintest gccdriver gccboot buildtools \
                memcorrupt threads termtest sungka pak lzozip hxdmp

.PHONY: all extract clean $(BUILD_ORDER)

all: extract $(BUILD_ORDER)

extract:
	./scripts/extract.sh

$(BUILD_ORDER):
	$(MAKE) -C components/$@

clean:
	@for c in $(BUILD_ORDER); do \
		if [ -f "components/$$c/Makefile" ]; then \
			$(MAKE) -C "components/$$c" clean || true; \
		fi; \
	done
