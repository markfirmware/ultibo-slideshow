#!/bin/bash
set -x

./scripts/test-with-qemu-monitor-commands.sh | /c/Ultibo/Core/qemu/qemu-system-arm.exe \
 -M versatilepb \
 -cpu cortex-a8 \
 -kernel "$PWD/kernel.bin" \
 -m 256M \
 -usb \
 -monitor stdio

/c/ProgramData/chocolatey/lib/imagemagick.tool/tools/convert.exe test-with-qemu.ppm test-with-qemu.png
