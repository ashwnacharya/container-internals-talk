#!/bin/bash

set -e

# Create the jail root's basic directory structure
JAIL=$HOME/jail
mkdir -p $JAIL
mkdir -p $JAIL/bin
mkdir -p $JAIL/lib64
mkdir -p $JAIL/lib
mkdir -p $JAIL/usr
mkdir -p $JAIL/usr/lib
mkdir -p $JAIL/usr/bin

# Copy bash and ls binaries into jailroot's bin
cp -v /bin/bash $JAIL/bin

# ldd command prints the shared libraries that the given executable depends on
list="$(ldd /bin/bash | egrep -o '/lib.*\.[0-9]')"
for i in $list; do cp -v "$i" "${JAIL}${i}"; done

cp -v /bin/ls $JAIL/bin

list="$(ldd /bin/ls | egrep -o '/lib.*\.[0-9]')"
for i in $list; do cp -v "$i" "${JAIL}${i}"; done

chroot $HOME/jail /bin/bash

