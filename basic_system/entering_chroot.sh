#!/bin/bash -e

LFS=/mnt/lfs

mkdir -pv $LFS/root
cp -fr $(pwd) $LFS/root

chroot "$LFS" /tools/bin/env -i \
    HOME=/root TERM="$TERM" PS1="\u:\w$ " \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
    LOGNAME=root \
    /tools/bin/bash --login +h
