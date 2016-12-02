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
    build-message "compiling $PROJECT with $1 $2"
    rm -f *.o
    $INSTALLPATH/fpc \
     -B \
     -Tultibo \
     -O2 \
     -Parm \
     $1 \
     @$INSTALLPATH/$2 \
     $EXTRA \
     $PROJECT
}

build "-CpARMV7A -WpRPI3B" $CFGRPI3
