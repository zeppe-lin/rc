TODO rc
-------

- [ ] "Cleanup files" contains the call of /usr/bin/find.
      That violates "separate /usr" boot.

- [ ] printf() isn't builtin by POSIX (only in dash), and by
      default is located in /usr/bin: that may breaks "separate /usr" boot.
      The replacement for "echo -n" also is not POSIX command
      (-n is extension).  Figure out what can be done.


DONE
----

- [x] switch to https://git.zx2c4.com/seedrng ?
      Or https://lists.crux.nu/pipermail/crux-devel/2019-June/004108.html ?
      Done: Sun Jun  4 12:52:10 PM EEST 2023

- [x] Add rc(8) manual page.
      May be use https://man.netbsd.org/NetBSD-6.1/rc.8 as reference?
      Done: Thu Apr 13 06:50:06 AM EEST 2023

- [x] rc.fix is not documented:
      This file contains some X11 font-related checks and is executed by
      rc.multi.  It's ugly to include this file into the rc package.  May
      be is better to move this file into one of the Xorg packages and
      place it into the /etc/X11/xinit/xinitrc.d/ directory?
      Done: Sun Jun  4 10:37:41 AM EEST 2023
