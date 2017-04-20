#!/bin/bash

tftp localhost 5069 << __EOF__
verbose
binary
trace
rexmt 5
timeout 5
put README.md
__EOF__
