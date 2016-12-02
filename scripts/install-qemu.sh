#!/bin/bash

QEMU="/c/Program Files (x86)/qemu"

if [[ ! -e "$QEMU" ]]
then
    set -x
    appveyor AddMessage "installing qemu"
    curl -fsSL -o qemu-installer.exe https://qemu.weilnetz.de/w32/qemu-w32-setup-20161130.exe
    ./qemu-installer.exe //verysilent
    ls $QEMU

    appveyor AddMessage "qemu installation complete"
fi
