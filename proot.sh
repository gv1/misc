#!/bin/sh
proot -q qemu-arm --rootfs=`pwd`/initrd-kirkwood/ -b /flash:/mnt  -b ./slackware.install.sh:/slackware.install.sh -b /arch.new/slackware.arm:slackware-14.1 -b /dev --root-id 
