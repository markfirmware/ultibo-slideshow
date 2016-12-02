#!/bin/bash

ULTIBO_VERSION=1.3.015
ULTIBO_RTL_VERSION=1.3.015

if [[ ! -e /c/Ultibo ]]
then
    set -x
    appveyor AddMessage "installing ultibo $ULTIBO_VERSION"
    curl -fsSL -o ultibo-installer.exe https://github.com/ultibohub/Core/releases/download/$ULTIBO_VERSION/Ultibo-Core-1.3.015-Cucumber.exe
    ./ultibo-installer //verysilent

    ls /c/Ultibo
    appveyor AddMessage "building ultibo rtl using __buildrtl.bat from $ULTIBO_RTL_VERSION"
    curl -fsSL -o ultibo-rtl-update.zip https://github.com/ultibohub/Core/archive/master.zip
    ls *.zip

    7z x -oultibo-rtl-update ultibo-rtl-update.zip
    ls ultibo-rtl-update/Core-master/source/rtl/ultibo
    ls /c/Ultibo/Core/fpc/3.1.1/source/rtl/ultibo
    rm -rf /c/Ultibo/Core/fpc/3.1.1/source/rtl/ultibo

    cp -a ultibo-rtl-update/Core-master/source/rtl/ultibo /c/Ultibo/Core/fpc/3.1.1/source/rtl/ultibo
    ls /c/Ultibo/Core/fpc/3.1.1/source/rtl/ultibo

    cp -a scripts/__buildrtl-1.3.015..bat /c/Ultibo/Core/fpc/3.1.1/source
    cd /c/Ultibo/Core/fpc/3.1.1/source
    cmd //c __buildrtl.bat
    cd $APPVEYOR_BUILD_FOLDER
fi
