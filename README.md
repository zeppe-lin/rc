ABOUT
-----
This directory contains *rc*, an init scripts used in conjunction with
*sysvinit* on *Zeppe-Lin*.

This *rc* distribution is a fork of CRUX' init scripts (extracted
from *rc* port) with the following differences:
  * rewritten in POSIX sh(1p)
  * added rc.conf(5) man page
  * added mdadm(1) to assemble raid volumes

The original sources can be downloaded from:
  1. https://crux.nu/ports/crux-3.6/core/rc/
  2. https://crux.nu/gitweb/?p=ports/core.git;a=tree;f=rc

REQUIREMENTS
------------
Build time:
  * POSIX sh(1p), make(1p) and "mandatory utilities"
  * pod2man(1pm) to build man pages

Runtime:
  * POSIX sh(1p) and "mandatory utilities"
  * sysvinit to execute initscripts and manage runlevels
  * util-linux and coreutils
  * udevd(8) from eudev/udev/systemd-udevd distribution for
    dynamic device management
  * sysctl(8) from procps/procps-ng distribution to set kernel
    variables
  * ldconfig(8) from glibc distribution to update shared library
    links
  * hostname(1) from inetutils distribution to configure host name
  * depmod(8) from kmod distribution to generate modules.dep and
    map files

    The following dependencies are optional:

  * setfont(8) and loadkeys(1) from kbd distribution to set system
    font and keyboard
  * vgscan(8), vgchange(8) and lvm(8) from lvm distribution to
    create device-mapper device nodes and scan for LVM volume
    groups
  * mdadm(8) from mdadm distribution to look for devices that
    could form further arrays and try to assemble them
  * mkfontdir(1) and mkfontscale(1) from xorg's mkfontscale
    distribution to create an index of font files for xorg package
  * fc-cache(1) from fontconfig distribution to build font
    information cache files

Tests:
  * podchecker(1pm) to check PODs for errors
  * httpx(1) to check URLs for non-200 response code

INSTALL
-------
The shell command `make && make install` should build and install this
package.  See [rc.conf(5)](rc.conf.5.pod) and customize `rc.conf` file
to adjust init conform your needs.

The shell command `make check` should start some tests.

LICENSE
-------
*rc* is licensed through the GNU General Public License v3 or later
<https://gnu.org./licenses/gpl.html>.
Read the *COPYING* file for copying conditions.
Read the *COPYRIGHT* file for copyright notices.

<!-- vim:sw=2:ts=2:sts=2:et:cc=72:tw=70
End of file. -->
