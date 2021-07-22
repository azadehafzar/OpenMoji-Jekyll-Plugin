#!/bin/bash
# Usage: script/ci_test.sh
#
# run all the tests.

# set flag for shell execution.
# -e  Exit immediately if a command exits with a non-zero status.
# -x  Print commands and their arguments as they are executed.
set -e

# files for testing.
JOP_RB="../lib/jekyll-openmoji.rb"
PLUGIN_RB="../lib/jekyll-openmoji/plugin.rb"
VERSION_RB="../lib/jekyll-openmoji/version.rb"

./test_module.sh "${JOP_RB}" "${PLUGIN_RB}" "${VERSION_RB}"
