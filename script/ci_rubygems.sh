#!/bin/bash
# Usage: script/ci_rubygems.sh
#
# Create credential file for rubygems.org.

# set flag for shell execution.
# -e  Exit immediately if a command exits with a non-zero status.
# -x  Print commands and their arguments as they are executed.
set -ex

mkdir -p ~/.gem
echo -e "---/r/n:mahdi_baghbani: ${RUBYGEMS_API_KEY}" > ~/.gem/credentials
chmod 0600 ~/.gem/credentials
ls ~/.gem
cat ~/.gem/credentials
