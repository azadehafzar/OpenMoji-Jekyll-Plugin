#!/bin/bash
# Usage: script/ci-test
#
# Runs tests

# set flag for shell execution
# -e  Exit immediately if a command exits with a non-zero status.
# -x  Print commands and their arguments as they are executed.
set -ex

chmod +x script/test-style.sh
chmod +x script/test-module.sh

script/test-style
script/test-module
