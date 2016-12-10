#!/bin/bash

# build on raspbian, windows/git/bash, and windows/appveyor

PROJECT=pslideshow.lpr

function build-message {
    echo $*
    if [[ "$APPVEYOR" == "True" ]]
    then
        appveyor AddMessage "$*"
    fi
}

CFGRPI=rpi.cfg
CFGRPI2=rpi2.cfg
CFGRPI3=rpi3.cfg
CFGQEMU=qemuvpb.cfg

if [[ "$HOME" == "/home/pi" ]]
then
    INSTALLPATH=/home/pi/ultibo/core/fpc/bin
    EXTRA=-XParm-none-eabi-
else
    INSTALLPATH=/c/Ultibo/Core/fpc/3.1.1/bin/i386-win32
    EXTRA=
fi

function build {
    build-message building $PROJECT for target $1
    rm -f *.o
    $INSTALLPATH/fpc \
     -dTARGET_$1 \
     -B \
     -Tultibo \
     -O2 \
     -Parm \
     $2 \
     @$INSTALLPATH/$3 \
     $PROJECT
}

build RPI_INCLUDING_RPI0 "-CpARMV6 -WpRPIB" $CFGRPI
build RPI2_INCLUDING_RPI3 "-CpARMV7A -WpRPI2B" $CFGRPI2
build QEMU32 "-CpARMV7A -WpQEMUVPB" $CFGQEMU
