.POSIX:

# rc version
VERSION = 2.32.1

CONFIGS  = inittab rc.conf
SCRIPTS  = rc rc.fix rc.local rc.modules rc.multi rc.shutdown rc.single
MANPAGES = rc.conf.5

all: ${MANPAGES}

%: %.pod
	pod2man --nourls -r ${VERSION} -c ' ' -n $(basename $@) \
		-s $(subst .,,$(suffix $@)) $< > $@

check:
	@echo "=======> Check PODs for errors"
	@podchecker *.pod
	@echo "=======> Check URLs for response code"
	@grep -Eiho "https?://[^\"\\'> ]+" *.* | xargs -P10 -I{} \
		curl -o /dev/null -sw "[%{http_code}] %{url}\n" '{}'

install: all
	mkdir -p ${DESTDIR}/etc
	cp -f ${CONFIGS} ${SCRIPTS} ${DESTDIR}/etc/
	cd ${DESTDIR}/etc && chmod 0644 ${CONFIGS}
	cd ${DESTDIR}/etc && chmod 0755 ${SCRIPTS}
	mkdir -p          ${DESTDIR}/usr/share/man/man5
	cp -f ${MANPAGES} ${DESTDIR}/usr/share/man/man5/
	mkdir -p   ${DESTDIR}/var/log      ${DESTDIR}/var/lib/urandom
	touch      ${DESTDIR}/var/log/boot ${DESTDIR}/var/lib/urandom/seed
	chmod 0640 ${DESTDIR}/var/log/boot ${DESTDIR}/var/lib/urandom/seed

uninstall:
	cd ${DESTDIR}/etc                && rm -f ${CONFIGS} ${SCRIPTS}
	cd ${DESTDIR}/usr/share/man/man5 && rm -f ${MANPAGES}
	rm -f ${DESTDIR}/var/log/boot
	rm -f ${DESTDIR}/var/lib/urandom/seed

clean:
	rm -f rc.conf.5

.PHONY: all check install uninstall clean
