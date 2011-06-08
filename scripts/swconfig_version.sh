#!/bin/bash

#
# version definition for swconfig
#
_swconfig_get_version()
{
    SWCONFIG_VERSION_FULL="$("${SWCONFIG_TOPDIR:=.}/scripts/kernel/setlocalversion" "${SWCONFIG_TOPDIR}/.tarball-version")"

    local orig_IFS="${IFS}"
    local IFS="."
    set -- ${SWCONFIG_VERSION_FULL}
    IFS="${orig_IFS}"

    SWCONFIG_VERSION_YEAR="${1}"
    SWCONFIG_VERSION_MONTH="${2}"
    SWCONFIG_VERSION_BUGFIX="${3%%-*}"
    SWCONFIG_VERSION_SCM="${3#${SWCONFIG_VERSION_BUGFIX}}"

    if [ -n "${SWCONFIG_VERSION_SCM}" ]; then
	SWCONFIG_VERSION_PTXRC="git"
    else
	SWCONFIG_VERSION_PTXRC="${SWCONFIG_VERSION_YEAR}.${SWCONFIG_VERSION_MONTH}"
    fi

}

_swconfig_get_version
