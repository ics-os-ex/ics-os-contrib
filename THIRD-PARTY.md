# Third-Party Licensing

This repository contains two kinds of material:

1. **ICS-OS contrib code**: original ICS-OS build overlays, Makefiles, SDK
   stubs, and original contrib application sources. This material is licensed
   under the GNU General Public License version 2, as stated in `LICENSE`.
2. **Third-party upstream/reference sources**: pinned tarballs under
   `sources/`, extracted trees under `sources/extract/`, and files copied or
   generated from those upstream projects into `components/`. Those files
   remain under their original licenses.

Where a file has an explicit copyright or SPDX header, that header and the
corresponding license text control.

## License texts

Human-readable copies of the license texts used by this repository are in
`docs/licenses/`.

| File | License |
|---|---|
| `LICENSE` | GNU General Public License, version 2 |
| `docs/licenses/GPLv2.txt` | GNU General Public License, version 2 |
| `docs/licenses/GPLv3.txt` | GNU General Public License, version 3 |
| `docs/licenses/LGPLv3.txt` | GNU Lesser General Public License, version 3 |
| `docs/licenses/GCC-Runtime-Exception.txt` | GCC Runtime Library Exception, version 3.1 |
| `docs/licenses/TCC-LGPLv2.1.txt` | GNU Lesser General Public License, version 2.1 |
| `docs/licenses/NetHack-GPL.txt` | NetHack General Public License |
| `docs/licenses/Vim-License.txt` | Vim License |
| `docs/licenses/Realtek-Firmware-License.txt` | Realtek firmware redistribution license |

## Pinned source packages

| Package | License | Notes |
|---|---|---|
| `binutils-2.23.tar.gz` | GPL-3.0-or-later | GNU binutils. |
| `gcc-4.7.4.tar.gz` | GPL-3.0-or-later, with GCC Runtime Library Exception where marked | GCC compiler source. |
| `gmp-5.1.3.tar.gz` | LGPL-3.0-or-later / GPL-3.0-or-later | GNU MP. |
| `grub-2.16-rc2.tar.gz` | GPL-3.0-or-later | GRUB bootloader reference source. |
| `make-3.82.tar.gz` | GPL-3.0-or-later | GNU Make. |
| `mpc-1.0.1.tar.gz` | LGPL-3.0-or-later | GNU MPC. |
| `mpfr-3.0.1.tar.gz` | LGPL-3.0-or-later / GPL-3.0-or-later | GNU MPFR. |
| `nethack-3.6.7-icsos.tar.gz` | NetHack General Public License | Modified NetHack 3.6.7 snapshot. See the package's `NOTICE-ICSOS.txt`. |
| `vim-9.2.1031.tar.gz` | Vim License | Vim source. ICS-OS build changes are provided in `components/vim/`. |
| `rtw88-icsos-reference.tar.gz` | File-specific SPDX identifiers, including GPL-2.0-only and GPL-2.0 OR BSD-3-Clause | Reference rtw88 driver source; not built by the default contrib build. |
| `rtw8821c-firmware.tar.gz` | Realtek firmware redistribution license | Binary firmware. License text is included in the package as `LICENCE.rtlwifi_firmware.txt`. |

## Vendored code in `components/`

| Component | Upstream material | License |
|---|---|---|
| `components/lzozip/` | MiniLZO files | GNU General Public License, version 2 |
| `components/tcc/` | TinyCC source and generated support files | GNU Lesser General Public License, version 2.1 |
| `components/gcc/` | GCC source headers and generated files | GPL-3.0-or-later, with GCC Runtime Library Exception where marked |
| `components/binutils/` | binutils source headers and generated files | GPL-3.0-or-later |
| `components/gmp/` | GMP generated tables and headers | LGPL-3.0-or-later / GPL-3.0-or-later |
| `components/mpfr/` | MPFR generated tables and headers | LGPL-3.0-or-later / GPL-3.0-or-later |
| `components/mpc/` | MPC generated tables and headers | LGPL-3.0-or-later |
| `components/gnumake/` | GNU Make configuration/build overlay | GPL-3.0-or-later |
| `components/vim/` | Vim build overlay and ICS-OS stubs | Vim License for upstream material; GPLv2 for original ICS-OS overlay files |
| `components/nethack/` | NetHack build overlay | NetHack General Public License for upstream material; GPLv2 for original ICS-OS overlay files |

## Modified upstream files

Modified upstream files carry prominent modification notices where the
upstream license requires them.

- `nethack-3.6.7-icsos.tar.gz`:
  - `include/config.h`
  - `include/unixconf.h`
  - `sys/share/unixtty.c`
  - See `NOTICE-ICSOS.txt` inside the extracted package.
- `vim-9.2.1031`: the upstream tarball is unmodified. ICS-OS build changes are
  provided separately in `components/vim/`, satisfying the Vim License
  requirement to make changes available.
- `rtw8821c-firmware`: the firmware binary is redistributed in binary form
  without modification, with the Realtek copyright notice and license text.

## Distribution notes

- The source tarballs under `sources/` are stored with Git LFS because some
  files exceed GitHub's normal Git object size limit.
- Extracted trees under `sources/extract/` are build inputs and are not
  committed.
- Build artifacts are not committed.
- If distributing only a built ICS-OS executable, also provide or clearly point
  to the corresponding source package and license notices in this repository.
