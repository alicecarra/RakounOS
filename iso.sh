#!/bin/sh
set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/rakounos.kernel isodir/boot/rakounos.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "RakounOS" {
<<<<<<< HEAD
	multiboot /boot/RakounOS.kernel
=======
	multiboot /boot/rakounos.kernel
>>>>>>> aa30ab26f787dd11a4f5960513c88127d2bdf842
}
EOF
grub-mkrescue -o rakounos.iso isodir
