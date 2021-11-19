#!/bin/sh
set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/rakounos.kernel isodir/boot/rakounos.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "RakounOS" {
	multiboot /boot/rakounos.kernel
}
EOF
grub-mkrescue -o rakounos.iso isodir
