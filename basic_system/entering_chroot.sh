#!/bin/bash -e

LFS=/mnt/lfs

mkdir -pv $LFS/root
cp -vfr $(pwd) $LFS/root

mkdir -pv $LFS/usr/src
cp -vf /usr/src/bee.tar $LFS/usr/src

chroot "$LFS" /tools/bin/env -i \
    HOME=/root TERM="$TERM" PS1="\u:\w$ " \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
    LOGNAME=root \
    /tools/bin/bash --login +h
