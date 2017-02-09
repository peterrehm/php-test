#!/bin/bash

dirname="$(dirname "$0")"

"$dirname/start_ramdisk.sh"
"$dirname/run_tests.sh" "$1" "$2" "$3"
"$dirname/stop_ramdisk.sh"
