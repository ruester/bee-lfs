#!/bin/bash -e

ARCH=$(uname -m)

for i in tc-binutils_pass1-2.21.1a-0 \
    tc-gcc_pass1-4.6.1-0 \
    tc-linux-headers-3.1-0 \
    tc-glibc-2.14.1-0 \
    tc-adjusted-specs-1-0 \
    tc-binutils_pass2-2.21.1a-0 \
    tc-gcc_pass2-4.6.1-0 \
    tc-tcl-8.5.10-0 \
    tc-expect-5.45-0 \
    tc-dejagnu-1.5-0 \
    tc-check-0.9.8-0 \
    tc-ncurses-5.9-0 \
    tc-bash-4.2-0 \
    tc-bzip2-1.0.6-0 \
    tc-coreutils-8.14-0 \
    tc-diffutils-3.2-0 \
    tc-file-5.09-0 \
    tc-findutils-4.4.2-0 \
    tc-gawk-4.0.0-0 \
    tc-gettext-0.18.1.1-0 \
    tc-grep-2.9-0 \
    tc-gzip-1.4-0 \
    tc-m4-1.4.16-0 \
    tc-make-3.82-0 \
    tc-patch-2.6.1-0 \
    tc-perl-5.14.2-0 \
    tc-sed-4.2.1-0 \
    tc-tar-1.26-0 \
    tc-texinfo-4.13a-0 \
    tc-xz-5.0.3-0 \
    tc-util-linux-2.20-0 \
    tc-wget-1.13-0 \
    tc-bee-1.0_rc21-0; do

    if [ "$(bee list -i ${i}.${ARCH} | wc -l)" == "0" ] ; then
        ./${i}.bee --no-archive-build -c
        bee install ${i}.${ARCH}
    fi
done

echo "building toolchain finished"
