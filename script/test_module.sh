#!/bin/bash
# Usage: script/test_modules.sh
#
# Runs tests.

# set flag for shell execution.
# -e  Exit immediately if a command exits with a non-zero status.
# -x  Print commands and their arguments as they are executed.
set -ex

bundle exec rspec "$@"
