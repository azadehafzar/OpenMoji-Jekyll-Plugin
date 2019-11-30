#!/bin/bash
# Usage: script/ci_test.sh
#
# Runs tests.

# set flag for shell execution.
# -e  Exit immediately if a command exits with a non-zero status.
# -x  Print commands and their arguments as they are executed.
set -ex

chmod +x script/test_style.sh
chmod +x script/test_module.sh

script/test_style.sh
script/test_module.sh
