#!/bin/bash -e

ARCH=$(uname -m)

for i in bee-1.0-0 \
    bee-1.0-0 \
    fhs-1.0-0 \
    linux-headers-3.1-0 \
    glibc-2.14.1-0 \
    zlib-1.2.5-0 \
    file-5.09-0 \
    binutils-2.21.1a-0 \
    gmp-5.0.2-0 \
    mpfr-3.1.0-0 \
    mpc-0.9-0 \
    gcc-4.6.1-0 \
    sed-4.2.1-0 \
    bzip2-1.0.6-0 \
    ncurses-5.9-0 \
    util-linux-2.20-0 \
    e2fsprogs-1.41.14-0 \
    coreutils-8.14-0 \
    iana-etc-2.30-0 \
    m4-1.4.16-0 \
    bison-2.5-0 \
    procps-3.2.8-0 \
    grep-2.9-0 \
    readline-6.2-0 \
    bash-4.2-0 \
    libtool-2.4-0 \
    gdbm-1.9.1-0 \
    inetutils-1.8-0 \
    perl-5.14.2-0 \
    autoconf-2.68-0 \
    automake-1.11.1-0 \
    diffutils-3.2-0 \
    gawk-4.0.0-0 \
    findutils-4.4.2-0 \
    flex-2.5.35-0 \
    gettext-0.18.1.1-0 \
    groff-1.21-0 \
    grub-1.99-0 \
    gzip-1.4-0 \
    kbd-1.15.2-0 \
    less-444-0 \
    libpipeline-1.2.0-0 \
    make-3.82-0 \
    xz-5.0.3-0 \
    man-db-2.6.0.2-0 \
    module-init-tools-3.16-0 \
    patch-2.6.1-0 \
    psmisc-22.14-0 \
    shadow-4.1.4.3-0 \
    sysklogd-1.5-0 \
    sysvinit-2.88dsf-0 \
    tar-1.26-0 \
    texinfo-4.13a-0 \
    udev-173-0 \
    vim-7.3-0 \
    nano-2.2.6-0; do

    if [ "$(bee list -i ${i}.${ARCH} | wc -l)" = "0" ]; then
        ./${i}.bee --no-archive-build -c
        bee install ${i}.${ARCH}

        if [ "${i}" = "glibc-2.14.1-0" ]; then
            ./configuring_glibc.sh
            ./readjusting_toolchain.sh
        fi
    fi
done
