#!/bin/bash
set -x

mkdir -p output

./scripts/linux-test-with-qemu-monitor-commands.sh | \
 qemu-system-arm \
 -M versatilepb \
 -cpu cortex-a8 \
 -kernel kernel.bin \
 -m 256M \
 -usb \
 -display none \
 -serial mon:stdio |& tee output/raw.log | egrep -iv '^(alsa|pulseaudio:|audio:)' > output/serial.log

convert output/screen-01.ppm output/screen-01.png
convert output/screen-02.ppm output/screen-02.png
rm output/*.ppm

cat output/serial.log
ls output
