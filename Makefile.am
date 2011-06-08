AUTOMAKE_OPTIONS = foreign

bin_PROGRAMS = swconfig
swconfig_SOURCES = cli.c swlib.c uci.c
swconfig_LDFLAGS = -lnl -lnl-genl

DISTCLEANFILES = \
	*~ \
	y.output \
	y.tab.c \
	y.tab.h \
	lex.zz.c

MAINTAINERCLEANFILES = \
	Makefile.in \
	aclocal.m4 \
	compile \
	config.guess \
	config.h.in \
	config.sub \
	configure \
	depcomp \
	install-sh \
	ltmain.sh \
	missing

maintainer-clean-local:
	-rm -fr m4/
