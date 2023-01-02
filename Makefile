.POSIX:

# rc version
VERSION = 2.32.1

all: rc.conf.5

%: %.pod
	pod2man --nourls -r ${VERSION} -c ' ' -n $(basename $@) \
		-s $(subst .,,$(suffix $@)) $< > $@

check:
	@echo "=======> Check PODs for errors"
	@podchecker *.pod
	@echo "=======> Check URLs for non-200 response code"
	@grep -Eiho "https?://[^\"\\'> ]+" *.* | httpx -silent -fc 200 -sc

install: all
	mkdir -p        ${DESTDIR}/etc
	cp inittab      ${DESTDIR}/etc/
	cp rc.conf      ${DESTDIR}/etc/
	cp rc           ${DESTDIR}/etc/
	cp rc.fix       ${DESTDIR}/etc/
	cp rc.local     ${DESTDIR}/etc/
	cp rc.modules   ${DESTDIR}/etc/
	cp rc.multi     ${DESTDIR}/etc/
	cp rc.shutdown  ${DESTDIR}/etc/
	cp rc.single    ${DESTDIR}/etc/
	mkdir -p        ${DESTDIR}/usr/share/man/man5
	cp rc.conf.5    ${DESTDIR}/usr/share/man/man5/
	mkdir -p        ${DESTDIR}/var/log      ${DESTDIR}/var/lib/urandom
	touch           ${DESTDIR}/var/log/boot ${DESTDIR}/var/lib/urandom/seed
	chmod 0640      ${DESTDIR}/var/log/boot ${DESTDIR}/var/lib/urandom/seed

uninstall:
	rm -f ${DESTDIR}/etc/inittab
	rm -f ${DESTDIR}/etc/rc.conf
	rm -f ${DESTDIR}/etc/rc
	rm -f ${DESTDIR}/etc/rc.fix
	rm -f ${DESTDIR}/etc/rc.local
	rm -f ${DESTDIR}/etc/rc.modules
	rm -f ${DESTDIR}/etc/rc.multi
	rm -f ${DESTDIR}/etc/rc.shutdown
	rm -f ${DESTDIR}/etc/rc.single
	rm -f ${DESTDIR}/usr/share/man/man5/rc.conf.5
	rm -f ${DESTDIR}/var/log/boot
	rm -f ${DESTDIR}/var/lib/urandom/seed

clean:
	rm -f rc.conf.5

.PHONY: install uninstall clean
