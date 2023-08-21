include config.mk

RCS  = rc rc.local rc.modules rc.multi rc.shutdown rc.single
MAN5 = rc.conf.5
MAN8 = rc.8

all: ${MAN5} ${MAN8}

%: %.pod
	pod2man -r "rc ${VERSION}" -c "System Administration" \
		-n $(basename $@) -s $(subst .,,$(suffix $@)) $< > $@

install: all
	mkdir -p ${DESTDIR}${SYSCONFDIR}
	mkdir -p ${DESTDIR}${MANPREFIX}/man5
	mkdir -p ${DESTDIR}${MANPREFIX}/man8
	mkdir -p ${DESTDIR}/var/log
	cp -f ${RCS}  ${DESTDIR}${SYSCONFDIR}/
	cp -f ${MAN5} ${DESTDIR}${MANPREFIX}/man5/
	cp -f ${MAN8} ${DESTDIR}${MANPREFIX}/man8/
	touch ${DESTDIR}/var/log/boot
	cd ${DESTDIR}${SYSCONFDIR}     && chmod 0755 ${RCS}
	cd ${DESTDIR}${MANPREFIX}/man5 && chmod 0644 ${MAN5}
	cd ${DESTDIR}${MANPREFIX}/man8 && chmod 0644 ${MAN8}
	chmod 0640 ${DESTDIR}/var/log/boot

uninstall:
	cd ${DESTDIR}${SYSCONFDIR}     && rm -f ${RCS}
	cd ${DESTDIR}${MANPREFIX}/man5 && rm -f ${MAN5}
	cd ${DESTDIR}${MANPREFIX}/man8 && rm -f ${MAN8}
	rm -f ${DESTDIR}/var/log/boot

clean:
	rm -f ${MAN5} ${MAN8}
	rm -f ${DIST}.tar.gz

dist: clean
	git archive --format=tar.gz -o ${DIST}.tar.gz --prefix=${DIST}/ HEAD

.PHONY: all install uninstall clean dist
