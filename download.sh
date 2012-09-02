#!/bin/bash

LFS=/mnt/lfs
DIR=${LFS}/sources

mkdir -pv $DIR
chmod a+wt $DIR
wget --no-check-certificate -i wget-list -P $DIR -N -nv

if [ -f $DIR/bee-1.2 ]; then
    mv $DIR/bee-1.2 $DIR/bee-1.2.tar.gz
fi

for i in $(cat wget-list); do
    A=$(basename $i)

    if [ "${A}" = "bee-1.2" ]; then
        A="${A}.tar.gz"
    fi

    if [ ! -f ${DIR}/${A} ]; then
        echo "*** ERROR *** ${A} could not be downloaded"
    fi
done
