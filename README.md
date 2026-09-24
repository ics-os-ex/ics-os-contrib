# ics-os-contrib

Standalone source and build-overlay repository for ICS-OS third-party and
contrib applications.

This repository is intentionally separate from the main ICS-OS kernel/support
library tree. It pins upstream/reference sources as tarballs, stores the
ICS-OS-specific build overlays, and provides scripts to extract and rebuild the
contrib applications against the ICS-OS SDK.

## Layout

```text
ics-os-contrib/
  Makefile              # convenience targets for extract/build/clean
  sources/              # pinned upstream/reference tarballs + SHA-256 manifest
    MANIFEST.sha256
    extract/            # ignored; populated by scripts/extract.sh
  components/           # ICS-OS build overlays and contrib app sources
    gcc/
    binutils/
    gmp/
    mpfr/
    mpc/
    gnumake/
    tcc/
    nethack/
    vim/
    hello/
    nc/
    ...
  scripts/
    extract.sh          # verify + extract pinned tarballs
    stage-make.sh       # stage/patch GNU make for the ICS-OS build
  docs/
```

## Prerequisites

The main ICS-OS tree must be available for the SDK. By default this repository
expects it at:

```text
../ics-os/ics-os
```

Override it from the command line if needed:

```sh
make -C components/hello ICSOS_ROOT=/path/to/ics-os/ics-os
```

Pinned source tarballs are extracted under:

```text
sources/extract/
```

That directory is ignored by git.

## Usage

Extract all pinned sources:

```sh
./scripts/extract.sh
```

Extract only what a component needs:

```sh
./scripts/extract.sh gcc binutils gmp mpfr mpc
```

Build one component:

```sh
make -C components/hello
make -C components/binutils
make -C components/gcc
make -C components/nethack
```

Build the common component set from the repository root:

```sh
make all
```

Install a component into the main ICS-OS tree:

```sh
make -C components/hello install
make -C components/binutils install
make -C components/nethack install
```

## Pinned sources

`sources/MANIFEST.sha256` records the SHA-256 hash for every pinned tarball.
`scripts/extract.sh` verifies the hash before extraction.

Current pinned sources:

| Tarball | Purpose |
|---|---|
| `binutils-2.23.tar.gz` | GNU as/ld/ar source |
| `gcc-4.7.4.tar.gz` | GCC C frontend/toolchain source |
| `gmp-5.1.3.tar.gz` | GMP math library source |
| `make-3.82.tar.gz` | GNU make source |
| `mpc-1.0.1.tar.gz` | MPC complex math library source |
| `mpfr-3.0.1.tar.gz` | MPFR floating point math library source |
| `nethack-3.6.7-icsos.tar.gz` | ICS-OS NetHack 3.6.7 source snapshot |
| `vim-9.2.1031.tar.gz` | vim source |
| `grub-2.16-rc2.tar.gz` | GRUB Multiboot2/bootloader reference source |
| `rtw88-icsos-reference.tar.gz` | rtw88 Wi-Fi driver reference source |
| `rtw8821c-firmware.tar.gz` | rtw8821c firmware reference binary + provenance note |

## Licensing

Original ICS-OS contrib code in this repository is licensed under GPLv2, as
described in `LICENSE`. Pinned upstream and reference packages keep their own
licenses. See `THIRD-PARTY.md` for the full package-by-package breakdown and
`docs/licenses/` for the relevant license texts.

## Notes

- Build artifacts (`*.o`, `*.a`, `*.exe`, `obj/`, `build/`, extracted sources)
  are not committed.
- The GCC overlay includes `components/gcc/gen/`, a deterministic snapshot of
  generated GCC headers required by the current ICS-OS cc1 build.
- The GMP/MPFR/MPC overlays include the generated headers/table sources needed
  to build `libgmp.a`, `libmpfr.a`, and `libmpc.a` without running the full
  upstream autotools pipeline.
- `components/nethack/` does not commit the expanded NetHack source tree. Use
  `sources/nethack-3.6.7-icsos.tar.gz` and `scripts/extract.sh`.
