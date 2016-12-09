#!/bin/bash

ULTIBO_VERSION=1.3.015
ULTIBO_RTL_VERSION=1.3.015
ULTIBO_SOURCE=/c/Ultibo/Core/fpc/3.1.1/source

if [[ ! -e /c/Ultibo ]]
then
    set -x
    appveyor AddMessage "installing ultibo $ULTIBO_VERSION"
    curl -fsSL -o ultibo-installer.exe https://github.com/ultibohub/Core/releases/download/$ULTIBO_VERSION/Ultibo-Core-$ULTIBO_VERSION-Cucumber.exe
    ./ultibo-installer //verysilent
    ls /c/Ultibo

    appveyor AddMessage "building ultibo rtl using __buildrtl.bat from $ULTIBO_RTL_VERSION"
    curl -fsSL -o ultibo-rtl-update.zip https://github.com/ultibohub/Core/archive/master.zip
    ls *.zip

    appveyor AddMessage "extracting ultibo rtl source"
    7z x -oultibo-rtl-update ultibo-rtl-update.zip
    ls ultibo-rtl-update/Core-master/source/rtl/ultibo
    
    appveyor AddMessage "moving ultibo rtl source into ultibo core folder"
    ls $ULTIBO_SOURCE/rtl/ultibo
    rm -rf $ULTIBO_SOURCE/rtl/ultibo
    cp -a ultibo-rtl-update/Core-master/source/rtl/ultibo $ULTIBO_SOURCE/rtl/ultibo
    ls $ULTIBO_SOURCE/rtl/ultibo

    appveyor AddMessage "compiling ultibo rtl"
    cp -a scripts/__buildrtl-$ULTIBO_RTL_VERSION.bat $ULTIBO_SOURCE
    cd $ULTIBO_SOURCE
    cmd //c __buildrtl-$ULTIBO_RTL_VERSION.bat
    cd $APPVEYOR_BUILD_FOLDER
    
    appveyor AddMessage "ultibo installation complete"
fi
