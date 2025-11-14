OVERVIEW
========

Init scripts used with `sysvinit` on Zeppe-Lin.

This project is a fork of CRUX init scripts (version 2.31, extracted
from the `rc` port) with the following changes:
  * POSIX `sh(1p)` instead of `bash(1)`
  * Manual pages: `rc(8)`, `rc.conf(5)`, and `rc.d(7)`
  * Optional `seedrng(8)` support to seed the kernel RNG from seed
    files
  * Optional `mdadm(1)` support to assemble RAID volumes
  * Optional `cryptmount(8)` support to parse `crypttab(5)` via
    `cryptsetup(8)`
  * Kernel ring buffer is saved to `/var/log/dmesg` instead of
    `/var/log/boot`
  * Configurable boot logging daemon (e.g., `bootlogd(8)`)
  * Configurable device manager instead of default `udevd(8)`
  * Configurable screen blanking timeout
  * Removal of `rc.fix` file
  * Mount `/dev/pts` and `/dev/shm` after `/dev`
  * Mount all virtual filesystems without writing to `/etc/mtab`,
    supporting read-only `/etc`

See git log for full history.

Original sources: https://git.crux.nu/ports/core/src/branch/3.6/rc


REQUIREMENTS
============

Build-time
----------
  * POSIX `sh(1p)`, `make(1p)` and "mandatory utilities"
  * `scdoc(1)` to build manual pages

Runtime
-------
  * POSIX `sh(1p)` and "mandatory utilities"
  * `sysvinit` to execute initscripts and manage runlevels
  * `util-linux` and `coreutils`
  * `udevd(8)` from `eudev/udev/systemd-udevd` for dynamic device
    management OR a custom device manager specified via `DEVMGR`
  * `sysctl(8)` from `procps`/`procps-ng` to set kernel variables
  * `ldconfig(8)` from `glibc` to update shared library links
  * `hostname(1)` from `inetutils` to set the hostname
  * `depmod(8)` from `kmod` to generate `modules.dep` and map files

The following dependencies are optional:

  * `bootlogd(8)` from `sysvinit` to support the boot logging
  * `setfont(8)` and `loadkeys(1)` from `kbd` to set console font and
    keyboard layout
  * `seedrng(8)` from `seedrng` for seeding the kernel RNG
  * `vgscan(8)`, `vgchange(8)` and `lvm(8)` from `lvm` to create
    device-mapper device nodes and scan for LVM volume groups
  * `mdadm(8)` from `mdadm` to detect and assemble RAID devices
  * `cryptmount(8)` from `cryptmount` to map/unmap encrypted volumes
    (requires `cryptsetup(8)`, `blkid(8)` and `mkswap(8)`)


INSTALLATION
============

To install this package, run:

    make install

Configuration parameters are in `config.mk`.

Post-Install
------------

Customize the following files after installation:

1. `/etc/rc.conf`: System-wide settings and `SERVICES` list.
   (See `rc.conf(5)`).
2. `/etc/inittab`: Manages the boot process and runlevels.
   (See `inittab(5)`).

For examples, check `extra/rc.conf.sample` or the Zeppe-Lin
[rc package](https://github.com/zeppe-lin/pkgsrc-core/tree/1.x/rc).

**Note on POSIX Environments**:
Some versions of `mount(1)` may not support non-numeric group names.
If encountering issues mounting `/dev/pts`, replace the group name
`git=tty` with the corresponding group ID number (e.g., `gid=5`) in
the main `rc` script.


DOCUMENTATION
=============

Manual pages are in `/man`.


LICENSE
=======

`rc` is licensed through the GNU General Public License v3 or later
<https://gnu.org./licenses/gpl.html>.
See `COPYING` for terms and `COPYRIGHT` for notices.
