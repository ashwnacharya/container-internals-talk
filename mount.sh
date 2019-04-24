#!/bin/bash
unshare -m /bin/bash
mkdir /tmp/testmount
mount -n -o size=1m -t tmpfs tmpfs /tmp/testmount
cd /tmp/testmount
touch 1.txt 2.txt 3.txt
