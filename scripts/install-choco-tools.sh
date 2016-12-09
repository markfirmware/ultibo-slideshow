#!/bin/bash

ls -lt /c/ProgramData/chocolatey
if [[ ! -e /c/ProgramData/chocolatey ]]
then
    set -x
    appveyor AddMessage "installing chocolatey imagemagick.tool"
    choco install imagemagick.tool
fi
