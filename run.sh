#!/bin/bash
set -x

./build.sh \
&& sudo cp /boot/raspbian/kernel7.img /boot/recover.kernel7.img \
&& sudo cp kernel7.img /boot \
&& sudo rm -f /boot/ultiboslideshow.log \
&& sudo reboot
