.POSIX:

include ../config.mk

MAN5 = rc.conf.5
MAN8 = rc.8

all:

lint:
	mandoc -Tlint $(MAN5) $(MAN8)

install:
	mkdir -p $(DESTDIR)$(MANPREFIX)/man5
	mkdir -p $(DESTDIR)$(MANPREFIX)/man8
	cp -f $(MAN5) $(DESTDIR)$(MANPREFIX)/man5
	cp -f $(MAN8) $(DESTDIR)$(MANPREFIX)/man8
	cd $(DESTDIR)$(MANPREFIX)/man5 && chmod 0644 $(MAN5)
	cd $(DESTDIR)$(MANPREFIX)/man8 && chmod 0644 $(MAN8)

uninstall:
	cd $(DESTDIR)$(MANPREFIX)/man5 && rm -f $(MAN5)
	cd $(DESTDIR)$(MANPREFIX)/man8 && rm -f $(MAN8)

clean:

.PHONY: all lint install uninstall clean
