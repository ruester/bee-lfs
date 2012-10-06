#!/bin/bash -e

for i in fhs-*-0 \
         bee-*-0; do
    if [ "$(/tools/bin/bee list -i ${i%%-\**} | wc -l)" = "0" ]; then
        /tools/bin/beesh ${i}.bee --no-archive-build --cleanup --install
    fi
done

for i in fhs-*-0 \
    bee-*-0 \
    linux-headers-*-0 \
    man-pages-*-0 \
    glibc-*-0 \
    tzdata-*-0 \
    zlib-*-0 \
    file-*-0 \
    binutils-*-0 \
    gmp-*-0 \
    mpfr-*-0 \
    mpc-*-0 \
    gcc-*-0 \
    sed-*-0 \
    bzip2-*-0 \
    pkg-config-*-0 \
    ncurses-*-0 \
    util-linux-*-0 \
    psmisc-*-0 \
    e2fsprogs-*-0 \
    shadow-*-0 \
    coreutils-*-0 \
    iana-etc-*-0 \
    m4-*-0 \
    bison-*-0 \
    procps-*-0 \
    grep-*-0 \
    readline-*-0 \
    bash-*-0 \
    libtool-*-0 \
    gdbm-*-0 \
    inetutils-*-0 \
    perl-*-0 \
    autoconf-*-0 \
    automake-*-0 \
    diffutils-*-0 \
    gawk-*-0 \
    findutils-*-0 \
    flex-*-0 \
    gettext-*-0 \
    groff-*-0 \
    xz-*-0 \
    grub-*-0 \
    less-*-0 \
    gzip-*-0 \
    iproute2-*-0 \
    kbd-*-0 \
    kmod-*-0 \
    libpipeline-*-0 \
    make-*-0 \
    man-db-*-0 \
    patch-*-0 \
    sysklogd-*-0 \
    sysvinit-*-0 \
    tar-*-0 \
    texinfo-*-0 \
    udev-lfs-*-0 \
    vim-*-0 \
    nano-*-0; do

    if [ "$(/usr/bin/bee list -i ${i%%-\**} | wc -l)" = "0" ]; then
        /usr/bin/beesh ${i}.bee --no-archive-build --cleanup --install

        if [ "${i}" = "tzdata-*-0" ]; then
            ./configuring_glibc.sh
            ./readjusting_toolchain.sh
        fi
    fi
done
