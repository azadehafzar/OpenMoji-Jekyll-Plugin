#!/bin/bash
# Usage: script/bootstrap
#
# Installs required gems.

# set flag for shell execution.
# -e  Exit immediately if a command exits with a non-zero status.
# -x  Print commands and their arguments as they are executed.
set -ex

source /usr/local/rvm/scripts/rvm
bundle install --path vendor