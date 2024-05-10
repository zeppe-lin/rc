OVERVIEW
========

This directory contains rc, an init scripts used in conjunction with sysvinit
on Zeppe-Lin.

This distribution is a fork of CRUX' init scripts (extracted from rc port) with
the following differences:
  * POSIX sh(1p) instead of bash(1)
  * rc(8) and rc.conf(5) manual pages
  * optional seedrng(8) for seeding the kernel RNG from seed files
  * optional mdadm(1) support to assemble raid volumes
  * optional cryptmount(8) support to parse crypttab(5) file by cryptsetup(8)
  * configurable timeout for screen blanking
  * remove rc.fix file

See git log for further differences.

The original sources can be downloaded from:
  1. https://crux.nu/ports/crux-3.6/core/rc/
  2. https://crux.nu/gitweb/?p=ports/core.git;a=tree;f=rc


REQUIREMENTS
============

Build time
----------
  * POSIX sh(1p), make(1p) and "mandatory utilities"

Runtime
-------
  * POSIX sh(1p) and "mandatory utilities"
  * sysvinit to execute initscripts and manage runlevels
  * util-linux and coreutils
  * udevd(8) from eudev/udev/systemd-udevd distribution for dynamic device
    management
  * sysctl(8) from procps/procps-ng distribution to set kernel variables
  * ldconfig(8) from glibc distribution to update shared library links
  * hostname(1) from inetutils distribution to configure host name
  * depmod(8) from kmod distribution to generate modules.dep and map files

The following dependencies are optional:

  * setfont(8) and loadkeys(1) from kbd distribution to set system font and
    keyboard
  * seedrng(8) for seeding the kernel random number generator from seed files
  * vgscan(8), vgchange(8) and lvm(8) from lvm distribution to create
    device-mapper device nodes and scan for LVM volume groups
  * mdadm(8) from mdadm distribution to look for devices that could form
    further arrays and try to assemble them
  * cryptmount(8) from cryptmount distribution to map/unmap encrypted volumes;
    requires cryptsetup(8), blkid(8) and mkswap(8)


INSTALL
=======

The shell command `make install` should install this package.  See `config.mk`
file for configuration parameters.

Next, you need to create and customize `/etc/rc.conf` and `/etc/inittab` files.
See rc.conf(5) and inittab(5) man pages respectively, and/or Zeppe-Lin
[rc package][1] for configuration example.

[1]: https://github.com/zeppe-lin/pkgsrc-core/tree/master/rc


LICENSE
=======

rc is licensed through the GNU General Public License v3 or later
<https://gnu.org./licenses/gpl.html>.
Read the COPYING file for copying conditions.
Read the COPYRIGHT file for copyright notices.
