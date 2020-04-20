#!/bin/bash
# Usage: script/ci_test.sh
#
# run all the tests.

# set flag for shell execution.
# -e  Exit immediately if a command exits with a non-zero status.
# -x  Print commands and their arguments as they are executed.
set -ex

script/test_module.sh || ./test_module.sh
