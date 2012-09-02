#!/bin/bash -e

ARCH=$(uname -m)

export BEE_MAKEFLAGS="-j $(grep -c processor /proc/cpuinfo)"

for i in tc-binutils_pass1-*-0 \
    tc-gcc_pass1-*-0 \
    tc-linux-headers-*-0 \
    tc-glibc-*-0 \
    tc-adjusted-specs-1-0 \
    tc-binutils_pass2-*-0 \
    tc-gcc_pass2-*-0 \
    tc-tcl-*-0 \
    tc-expect-*-0 \
    tc-dejagnu-*-0 \
    tc-check-*-0 \
    tc-ncurses-*-0 \
    tc-bash-*-0 \
    tc-bzip2-*-0 \
    tc-coreutils-*-0 \
    tc-diffutils-*-0 \
    tc-file-*-0 \
    tc-findutils-*-0 \
    tc-gawk-*-0 \
    tc-gettext-*-0 \
    tc-grep-*-0 \
    tc-gzip-*-0 \
    tc-m4-*-0 \
    tc-make-*-0 \
    tc-patch-*-0 \
    tc-perl-*-0 \
    tc-sed-*-0 \
    tc-tar-*-0 \
    tc-texinfo-*-0 \
    tc-xz-*-0 \
    tc-util-linux-*-0 \
    tc-bee-*-0; do

    if [ "$(bee list -i ${i%%-\**} | wc -l)" == "0" ] ; then
        ./${i}.bee --no-archive-build --cleanup --install
    fi
done

echo "building toolchain finished"
