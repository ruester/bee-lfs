#!/bin/bash

LFS=/mnt/lfs

umount -v $LFS/dev/pts
umount -v $LFS/dev/shm
umount -v $LFS/dev
umount -v $LFS/proc
umount -v $LFS/sys
umount -v $LFS
