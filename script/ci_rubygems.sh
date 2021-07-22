#!/bin/bash
# Usage: script/ci_rubygems.sh
#
# Create credential file for rubygems.org.

# set flag for shell execution.
# -e  Exit immediately if a command exits with a non-zero status.
set -e

mkdir --parents ~/.gem
touch ~/.gem/credentials
chmod 0600 ~/.gem/credentials
printf -- "---\r\n:rubygems_api_key: %s\n" "${RUBYGEMS_API_KEY}" > ~/.gem/credentials
