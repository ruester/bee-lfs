#!/bin/bash

LFS=/mnt/lfs
DIR=${LFS}/sources

mkdir -pv $DIR
chmod a+wt $DIR
wget --no-check-certificate -i wget-list -P $DIR -N -nv

for i in $(cat wget-list); do
    A=$(basename $i)

    if [ ! -f ${DIR}/${A} ]; then
        echo "*** ERROR *** ${A} could not be downloaded"
    fi
done
