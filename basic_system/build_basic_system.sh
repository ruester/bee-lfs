#!/bin/bash -e

ARCH=$(uname -m)

for i in fhs-1.0 \
         bee-1.0_rc23; do
    if [ "$(/tools/bin/bee list -i ${i}-0.${ARCH} | wc -l)" = "0" ]; then
        ./${i}-0.bee --no-archive-build --cleanup
        /tools/bin/bee install ${i}-0.${ARCH}
    fi
done

for i in fhs-1.0 \
    bee-1.0_rc23 \
    linux-headers-3.2.6 \
    man-pages-3.35 \
    glibc-2.14.1 \
    zlib-1.2.6 \
    file-5.10 \
    binutils-2.22 \
    gmp-5.0.4 \
    mpfr-3.1.0 \
    mpc-0.9 \
    gcc-4.6.2 \
    sed-4.2.1 \
    bzip2-1.0.6 \
    ncurses-5.9 \
    util-linux-2.20.1 \
    psmisc-22.15 \
    e2fsprogs-1.42 \
    coreutils-8.15 \
    iana-etc-2.30 \
    m4-1.4.16 \
    bison-2.5 \
    procps-3.2.8 \
    grep-2.10 \
    readline-6.2 \
    bash-4.2 \
    libtool-2.4.2 \
    gdbm-1.10 \
    inetutils-1.9.1 \
    perl-5.14.2 \
    autoconf-2.68 \
    automake-1.11.3 \
    diffutils-3.2 \
    gawk-4.0.0 \
    findutils-4.4.2 \
    flex-2.5.35 \
    gettext-0.18.1.1 \
    groff-1.21 \
    xz-5.0.3 \
    grub-1.99 \
    gzip-1.4 \
    iproute2-3.2.0 \
    kbd-1.15.2 \
    kmod-5 \
    less-444 \
    libpipeline-1.2.0 \
    make-3.82 \
    man-db-2.6.1 \
    patch-2.6.1 \
    shadow-4.1.5 \
    sysklogd-1.5 \
    sysvinit-2.88dsf \
    tar-1.26 \
    texinfo-4.13a \
    udev-181 \
    vim-7.3 \
    nano-2.2.6; do

    if [ "$(/usr/bin/bee list -i ${i}-0.${ARCH} | wc -l)" = "0" ]; then
        ./${i}-0.bee --no-archive-build --cleanup
        /usr/bin/bee install ${i}-0.${ARCH}

        if [ "${i}" = "glibc-2.14.1" ]; then
            ./configuring_glibc.sh
            ./readjusting_toolchain.sh
        fi
    fi
done
