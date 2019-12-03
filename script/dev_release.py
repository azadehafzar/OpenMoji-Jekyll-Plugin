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
version_info = None

# find version.
for line in version_file:
    if "VERSION = " in line:
        # find version string and covert it to
        # standard x.y.z version format.
        double_quote_left = line.index("\"") + 1
        double_quote_right = line[double_quote_left:].index("\"") + double_quote_left
        version = line[double_quote_left:double_quote_right]
        # creat a list from x.y.z string which has [x, y, z]
        # notice that x, y , z must be converted to integer
        version_info = [int(number) for number in version.split(".")]

# throw error if version not found.
if not version or not version_info:
    raise ValueError("ERROR: version not found at version.rb.")

print("This program will tag a new release of OpenMoji Jekyll Plugin\n"
      + "and it will push to gitlab and github for building,\n"
      + "gitlab will push a built gem to rubygems.org.\n\n"
      + f"current version is {version}\n\n")

# read and convert to integer.
print("Version is in X.Y.Z form.\n"
      "X is version major, Y is version minor, Z is version minor.\n\n")
new_major = int(input("Enter version major number:\n"))
new_minor = int(input("Enter version minor  number:\n"))
new_patch = int(input("Enter version patch number:\n"))

new_version = ".".join(map(str, [new_major, new_minor, new_patch]))

# check version to be bigger than last version.
if new_version == version:
    raise ValueError("Version can't be same as current version!")

if new_major < version_info[0]:
    raise ValueError("Major version can't be less than current version!")
elif new_minor < version_info[1]:
    raise ValueError("Minor version can't be less than current version!")
elif new_patch < version_info[2]:
    raise ValueError("Patch version can't be less than current version!")


# creat an empty list for new version.rb file
print("Writing new version. \n\n")

new_version_rb = list()

# write new VERSION in version.rb.
new_version_info = f"    VERSION = \"{new_major}.{new_minor}.{new_patch}\"\n"

# replace old version with new one.
with open(version_file_path, "r") as file:
    lines = file.readlines()
    for line in lines:
        if "VERSION = " in line:
            new_version_rb.append(new_version_info)
        else:
            new_version_rb.append(line)

# write updated content from new_version_rb
# back into version.rb. file
with open(version_file_path, "w+") as file:
    file.writelines(new_version_rb)

# do git commit and tag and push to upstreams
print("Commit and Tag and Push to upstream. \n\n")

subprocess.call(f"git commit \"{version_file_path}\" -m \"version: OpenMoji Jekyll Plugin v{new_version}\"", shell=True)
subprocess.call(f"git tag \"v{new_version}\"", shell=True)
subprocess.call(f"git push origin HEAD \"v{new_version}\"", shell=True)
subprocess.call(f"git push github HEAD \"v{new_version}\"", shell=True)
