#!/bin/bash

atftp localhost 5069 << __EOF__
verbose
mode octet
trace
timeout 2
put a
__EOF__
