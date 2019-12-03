#!/usr/bin/env python3

# Python Standard Library
import os
import subprocess

# get path to this file's directory, then go one directory up.
file_path = os.path.abspath(os.path.dirname(__file__))
base_path = os.path.abspath(os.path.dirname(file_path))
version_file_path = os.path.join(base_path, "lib", "jekyll-openmoji", "version.rb")

# open version file.
with open(version_file_path) as file:
    version_file = file.readlines()

# set version and version_info to None, so if we didn't find
# a version in version.rb, we can throw an error.
version = None

# find version
for line in version_file:
    if "VERSION = " in line:
        # find version string and covert it to
        # standard x.y.z version format.
        double_quote_left = line.index("\"")
        double_quote_right = line.index("\"")
        version = line[double_quote_left + 1:double_quote_right]

# throe error if version not found
if not version:
    raise ValueError("ERROR: version not found at version.rb.")

# remove tag in local and remote repository
subprocess.call(f"git tag -d \"v{version}\"", shell=True)
subprocess.call(f"git push --delete origin \"v{version}\"", shell=True)
subprocess.call(f"git push --delete github \"v{version}\"", shell=True)

# revert last commit
subprocess.call(f"git revert HEAD", shell=True)
