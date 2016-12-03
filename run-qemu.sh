#!/bin/bash

/c/Ultibo/Core/qemu/qemu-system-arm.exe \
 -M versatilepb \
 -cpu cortex-a8 \
 -kernel "$PWD/kernel.bin" \
 -m 256M \
 -usb \
 -full-screen
