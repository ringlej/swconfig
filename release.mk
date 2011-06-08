version		:= $(shell . ./scripts/swconfig_version.sh && echo $${SWCONFIG_VERSION_FULL})
project		:= swconfig-$(version)

SHELL		:= /bin/bash
export SHELL

release:
	@scripts/make_$@.sh

dirty-check:
	@case "$(version)" in \
		*-dirty) echo "refusing to install or package a dirty git tree!" ; exit 1 ;; \
	esac

dist: dirty-check
	rm -rf "$(project)"
	git archive "$(project)" --prefix="$(project)"/ > "${project}.tar"
	tar xf "${project}.tar"
	echo -n "${version}" > "${project}/.tarball-version"
	cd "$(project)"

	tar -rf "${project}.tar" \
		"${project}/.tarball-version"
	bzip2 "${project}.tar"
	md5sum "${project}.tar.bz2" > "${project}.tar.bz2.md5"

