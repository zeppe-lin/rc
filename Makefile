.POSIX:

include config.mk

RCS  = rc rc.fix rc.local rc.modules rc.multi rc.shutdown rc.single
MAN5 = rc.conf.5

all: ${MAN5}

%: %.pod
	pod2man --nourls -r "rc ${VERSION}" -c ' ' \
		-n $(basename $@) -s $(subst .,,$(suffix $@)) $< > $@

check:
	@echo "=======> Check PODs for errors"
	@podchecker *.pod
	@echo "=======> Check URLs for response code"
	@grep -Eiho "https?://[^\"\\'> ]+" *.* | xargs -P10 -I{} \
		curl -o /dev/null -sw "[%{http_code}] %{url}\n" '{}'

install: all
	mkdir -p ${DESTDIR}/etc
	mkdir -p ${DESTDIR}${MANPREFIX}/man5
	cp -f ${RCS}  ${DESTDIR}/etc/
	cp -f ${MAN5} ${DESTDIR}${MANPREFIX}/man5/
	cd ${DESTDIR}/etc              && chmod 0755 ${RCS}
	cd ${DESTDIR}${MANPREFIX}/man5 && chmod 0644 ${MAN5}
	mkdir -p   ${DESTDIR}/var/log      ${DESTDIR}/var/lib/urandom
	touch      ${DESTDIR}/var/log/boot ${DESTDIR}/var/lib/urandom/seed
	chmod 0640 ${DESTDIR}/var/log/boot ${DESTDIR}/var/lib/urandom/seed

uninstall:
	cd ${DESTDIR}/etc              && rm -f ${RCS}
	cd ${DESTDIR}${MANPREFIX}/man5 && rm -f ${MAN5}
	rm -f ${DESTDIR}/var/log/boot
	rm -f ${DESTDIR}/var/lib/urandom/seed

clean:
	rm -f ${MAN5}

.PHONY: all check install uninstall clean
