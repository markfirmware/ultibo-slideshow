#!/bin/bash

./build.sh
scripts/test-with-qemu.sh
cat test-with-qemu.txt
