#!/bin/bash

tftp localhost << __EOF__
verbose
mode octet
trace
timeout 2
put kernel.bin
__EOF__
