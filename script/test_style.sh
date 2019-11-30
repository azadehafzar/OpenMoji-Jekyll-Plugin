#!/bin/bash
# Usage: script/test_style.sh
#
# Check code style wit rubocop.

# set flag for shell execution.
# -e  Exit immediately if a command exits with a non-zero status.
set -e

echo "Rubocop $(bundle exec rubocop --version)"
bundle exec rubocop -S -D -E "$@"

success=$?
if ((success != 0)); then
   echo -e "\nTry running \`script/fmt -a\` to automatically fix errors"
fi

exit $success
