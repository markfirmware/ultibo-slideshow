#!/bin/bash

# build on raspbian, windows/git/bash, and windows/appveyor

PROJECT=pslideshow.lpr

function build-message {
    if [[ "$APPVEYOR" == "True" ]]
    then
        appveyor AddMessage $*
    else
        echo $*
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
    rm -f *.o
    $INSTALLPATH/fpc \
     -dBUILD_$1 \
     -B \
     -Tultibo \
     -O2 \
     -Parm \
     $2 \
     @$INSTALLPATH/$3 \
     $PROJECT
}

build RPI "-CpARMV6 -WpRPIB" $CFGRPI
build RPI2 "-CpARMV7A -WpRPI2B" $CFGRPI2
build QEMU "-CpARMV7A -WpQEMUVPB" $CFGQEMU
