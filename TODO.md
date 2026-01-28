TODO rc
=======


No milestone
------------

- [ ] Early Boot /usr Separation: Transition RC Scripts to rootfs-only
  (/) Binaries:
  https://github.com/zeppe-lin/rc/issues/10

- [ ] Remove `/usr/bin/find` invocations:
  https://github.com/zeppe-lin/rc/issues/6

- [ ] `printf()` isn't builtin by POSIX `sh(1p)`:
  https://github.com/zeppe-lin/rc/issues/2


Done
----

- [x] Adjust `rc.d` man page to the openbsd's `rc` man pages?
  https://man.openbsd.org/rc.8 https://man.openbsd.org/rc.d.8

- [x] Support `bootlogd(8)`: https://github.com/zeppe-lin/rc/issues/7

- [x] `cryptmount` mounts `%random` volumes before `seedrng`:
  https://github.com/zeppe-lin/rc/issues/8

- [x] Support `modules-load.d` directory for module initialization
  https://github.com/zeppe-lin/rc/issues/9
