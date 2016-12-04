#!/bin/bash
set -x

rm -f screen1.ppm
./qemu-monitor-commands.sh | /c/Ultibo/Core/qemu/qemu-system-arm.exe \
 -M versatilepb \
 -cpu cortex-a8 \
 -kernel "$PWD/kernel.bin" \
 -m 256M \
 -usb \
 -monitor stdio
convert screen1.ppm screen1.png
