#!/bin/bash

tftp localhost 5070 << __EOF__
verbose
binary
trace
rexmt 5
timeout 5
put kernel.bin
__EOF__
