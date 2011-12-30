#!/bin/bash -e

LFS=/mnt/lfs

cp -vfr $(pwd) $LFS/root

chroot "$LFS" /tools/bin/env -i \
    HOME=/root TERM="$TERM" PS1="\u:\w$ " \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
    /tools/bin/bash --login +h
