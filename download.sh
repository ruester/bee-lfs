#!/bin/bash

LFS=/mnt/lfs
DIR=${LFS}/sources

mkdir -pv $DIR
chmod a+wt $DIR
wget --no-check-certificate -i wget-list -P $DIR -N -nv

if [ -f $DIR/bee-1.0_rc23 ]; then
    mv $DIR/bee-1.0_rc23 $DIR/bee-1.0_rc23.tar.gz
fi

if [ $(ls -1 $DIR | wc -l) -ne $(cat wget-list | wc -l) ]; then
    echo "ERROR: some files could not be downloaded"
else
    echo "All downloads finished"
fi
