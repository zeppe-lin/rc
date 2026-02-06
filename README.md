OVERVIEW
========

Init scripts for `sysvinit` on Zeppe-Lin.

This distribution is a fork of CRUX init scripts (version 2.31,
extracted from the `rc` port), with the following differences:
  * Rewritten in POSIX `sh(1p)` instead of `bash(1)`
  * Added manual pages: `rc(8)`, `rc.conf(5)`, and `rc.d(7)`
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
  * Removed `rc.fix` file
  * Mount `/dev/pts` and `/dev/shm` after `/dev`
  * Mount all virtual filesystems without writing to `/etc/mtab`
    (supports read-only `/etc`)
  * Optional delegation of module list handling to the standalone
    `modules-load(8)` utility

See the git log for full history.

Original sources:
  * <https://git.crux.nu/ports/core/src/branch/3.6/rc>

---

REQUIREMENTS
============

Build-time
----------
  * POSIX `sh(1p)`, `make(1p)` and "mandatory utilities"
  * `scdoc(1)` to generate manual pages

Runtime
-------
  * POSIX `sh(1p)` and "mandatory utilities"
  * `sysvinit` to run initscripts and manage runlevels
  * `util-linux` and `coreutils`
  * `udevd(8)` from `eudev`/`udev`/`systemd-udevd` for device
    management, or a custom manager specified via `DEVMGR`
  * `sysctl(8)` from `procps`/`procps-ng` to set kernel variables
  * `ldconfig(8)` from `glibc` to update shared library links
  * `hostname(1)` from `inetutils` to set the hostname
  * `depmod(8)` from `kmod` to generate `modules.dep` and map files

**Optional dependencies:**
  * `bootlogd(8)` from `sysvinit` for boot logging
  * `setfont(8)` and `loadkeys(1)` from `kbd` for console font and
    keyboard layout
  * `seedrng(8)` from `seedrng` to seed the kernel RNG
  * `vgscan(8)`, `vgchange(8)`, and `lvm(8)` from `lvm` for
    device-mapper nodes and LVM volume groups
  * `mdadm(8)` from `mdadm` to detect and assemble RAID devices
  * `cryptmount(8)` from `cryptmount` to manage encrypted volumes
    (requires `cryptsetup(8)`, `blkid(8)`, and `mkswap(8)`)
  * `modules-load(8)` from
    [modules-load](https://github.com/zeppe-lin/modules-load) to load
    modules from configuration directories

---

INSTALLATION
============

To install:

```sh
# as root
make install
```

Configuration parameters are defined in `config.mk`.

Post-Install
------------

Customize the following files:

1. `/etc/rc.conf`:
   System-wide settings and `SERVICES` list (see `rc.conf(5)`).
2. `/etc/inittab`:
   Manages the boot process and runlevels (see `inittab(5)`).

Examples are provided in `extra/rc.conf.sample`,
`extra/inittab.sample`, and in the Zeppe-Lin
[rc package](https://github.com/zeppe-lin/pkgsrc-core/tree/1.x/rc).

**Note on POSIX Environments**:
Some versions of `mount(1)` may not support non-numeric group names.
If mounting `/dev/pts` fails, replace `git=tty` with the numeric group
ID (e.g., `gid=5`) in the main `rc` script.

---

DOCUMENTATION
=============

Manual pages are provided in `/man` and installed under the system
manual hierarchy.

---

LICENSE
=======

`rc` is licensed under the
[GNU General Public License v3 or later](https://gnu.org./licenses/gpl.html).

See `COPYING` for license terms and `COPYRIGHT` for notices.
