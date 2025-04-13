.POSIX:

include ../config.mk

SRCS = rc rc.local rc.modules rc.multi rc.shutdown rc.single

all:

lint:
	shellcheck -s sh $(SRCS)

install:
	mkdir -p $(DESTDIR)$(SYSCONFDIR)/
	cp -f $(SRCS) $(DESTDIR)$(SYSCONFDIR)/
	cd $(DESTDIR)$(SYSCONFDIR) && chmod 0755 $(SRCS)
	mkdir -p $(DESTDIR)/var/log/
	touch $(DESTDIR)/var/log/boot
	chmod 0640 $(DESTDIR)/var/log/boot

uninstall:
	cd $(DESTDIR)$(SYSCONFDIR) && rm -f $(SRCS)

clean:

.PHONY: all lint install uninstall clean
