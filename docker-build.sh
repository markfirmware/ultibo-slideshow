#!/bin/bash
set -x
rm *.elf *.img *.o *.ppu
docker run --rm -v $(pwd):/workdir markfirmware/ufpc \
 -dTARGET_QEMU32 -B -Tultibo -O2 -Parm -CpARMV7A -WpQEMUVPB @/root/ultibo/core/fpc/bin/qemuvpb.cfg \
 pslideshow.lpr
docker run --rm -v $(pwd):/workdir markfirmware/ufpc \
 -dTARGET_RPI3 -B -Tultibo -O2 -Parm -CpARMV7A -WpRPI3B @/root/ultibo/core/fpc/bin/rpi3.cfg \
 pslideshow.lpr
