.POSIX:

include ../config.mk

RCS = rc rc.local rc.modules rc.multi rc.shutdown rc.single

all:

install:
	mkdir -p $(DESTDIR)$(SYSCONFDIR)/
	cp -f $(RCS) $(DESTDIR)$(SYSCONFDIR)/
	cd $(DESTDIR)$(SYSCONFDIR) && chmod 0755 $(RCS)
	mkdir -p $(DESTDIR)/var/log/
	touch $(DESTDIR)/var/log/dmesg
	chmod 0640 $(DESTDIR)/var/log/dmesg

uninstall:
	cd $(DESTDIR)$(SYSCONFDIR) && rm -f $(RCS)

clean:

.PHONY: all install uninstall clean
