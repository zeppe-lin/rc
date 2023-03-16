.POSIX:

include config.mk

RCS  = rc rc.fix rc.local rc.modules rc.multi rc.shutdown rc.single
MAN5 = rc.conf.5

all: ${MAN5}

%: %.pod
	pod2man -r "rc ${VERSION}" -c ' ' -n $(basename $@) \
		-s $(subst .,,$(suffix $@)) $< > $@

install-dirs:
	mkdir -p ${DESTDIR}${SYSCONFDIR}
	mkdir -p ${DESTDIR}${MANPREFIX}/man5
	mkdir -p ${DESTDIR}/var/log
	mkdir -p ${DESTDIR}/var/lib/urandom

install: all install-dirs
	cp -f ${RCS}  ${DESTDIR}${SYSCONFDIR}/
	cp -f ${MAN5} ${DESTDIR}${MANPREFIX}/man5/
	touch ${DESTDIR}/var/log/boot
	touch ${DESTDIR}/var/lib/urandom/seed
	cd ${DESTDIR}${SYSCONFDIR}     && chmod 0755 ${RCS}
	cd ${DESTDIR}${MANPREFIX}/man5 && chmod 0644 ${MAN5}
	chmod 0640 ${DESTDIR}/var/log/boot
	chmod 0640 ${DESTDIR}/var/lib/urandom/seed

uninstall:
	cd ${DESTDIR}${SYSCONFDIR}     && rm -f ${RCS}
	cd ${DESTDIR}${MANPREFIX}/man5 && rm -f ${MAN5}
	rm -f ${DESTDIR}/var/log/boot
	rm -f ${DESTDIR}/var/lib/urandom/seed

clean:
	rm -f ${MAN5}

.PHONY: all install-dirs install uninstall clean
