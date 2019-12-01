#!/bin/bash
# Usage: script/ci_setup.sh
#
# Install required programs fo ci jobs.

# set flag for shell execution.
# -e  Exit immediately if a command exits with a non-zero status.
# -x  Print commands and their arguments as they are executed.
set -ex

# install curl.
apt-get update -y
apt-get install -y curl
curl --version
command -v curl

# install git.
apt-get install -y git-core
git --version
command -v git

# install codeclimate coverage reporter.
curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > /usr/bin/cc-test-reporter
chmod +x /usr/bin/cc-test-reporter
