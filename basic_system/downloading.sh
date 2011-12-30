#!/bin/bash

LFS=/mnt/lfs

mkdir -pv $LFS/usr/src
chmod -v a+wt $LFS/usr/src
wget -i wget-list -P $LFS/usr/src
cp -v /usr/src/bee-git.tar $LFS/usr/src/bee-1.0.tar.gz
