OVERVIEW
--------
This directory contains rc, an init scripts used in conjunction with
sysvinit on Zeppe-Lin.

This distribution is a fork of CRUX' init scripts (extracted from rc
port) with the following differences:
- rewritten in POSIX sh(1p)
- added rc.conf(5) man page
- added rc(8) man page
- added mdadm(1) to assemble raid volumes
- added cryptmount(8) to parse crypttab(5) files and map encrypted
  volumes
- make screen blanking timeout configurable
- get rid of rc.fix file

See git log for further differences.

The original sources can be downloaded from:
1. https://crux.nu/ports/crux-3.6/core/rc/
2. https://crux.nu/gitweb/?p=ports/core.git;a=tree;f=rc


REQUIREMENTS
------------
**Build time**:
- POSIX sh(1p), make(1p) and "mandatory utilities"
- pod2man(1pm) to build man pages

**Runtime**:
- POSIX sh(1p) and "mandatory utilities"
- sysvinit to execute initscripts and manage runlevels
- seedrng for seeding the kernel random number generator from seed files
- util-linux and coreutils
- udevd(8) from eudev/udev/systemd-udevd distribution for dynamic
  device management
- sysctl(8) from procps/procps-ng distribution to set kernel variables
- ldconfig(8) from glibc distribution to update shared library links
- hostname(1) from inetutils distribution to configure host name
- depmod(8) from kmod distribution to generate modules.dep and map
  files

The following dependencies are optional:

- setfont(8) and loadkeys(1) from kbd distribution to set system font
  and keyboard
- vgscan(8), vgchange(8) and lvm(8) from lvm distribution to create
  device-mapper device nodes and scan for LVM volume groups
- mdadm(8) from mdadm distribution to look for devices that could form
  further arrays and try to assemble them
- cryptmount(8) from cryptmount distribution to map/unmap encrypted
  volumes; requires cryptsetup(8), blkid(8) and mkswap(8)
- mkfontdir(1) and mkfontscale(1) from xorg's mkfontscale distribution
  to create an index of font files for xorg package
- fc-cache(1) from fontconfig distribution to build font information
  cache files


INSTALL
-------
The shell commands `make && make install` should build and install
this package.

Next, you need to create and customize `/etc/rc.conf` and
`/etc/inittab` files.  See rc.conf(5) and inittab(5) man pages
respectively, and/or Zeppe-Lin [rc package][1] for configuration
example.

[1]: https://github.com/zeppe-lin/pkgsrc-core/tree/master/rc


LICENSE
-------
rc is licensed through the GNU General Public License v3 or later
<https://gnu.org./licenses/gpl.html>.
Read the COPYING file for copying conditions.
Read the COPYRIGHT file for copyright notices.
