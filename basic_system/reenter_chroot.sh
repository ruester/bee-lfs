#!/bin/bash -e

LFS=/mnt/lfs

cp -vfr $(pwd)/../making_bootable $LFS/root

chroot "$LFS" /usr/bin/env -i \
    HOME=/root TERM="$TERM" PS1='\u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin \
    LOGNAME=root \
    /bin/bash --login
