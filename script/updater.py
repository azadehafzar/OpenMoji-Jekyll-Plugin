#!/usr/bin/env python3

# Python Standard Library
import os
import shutil
import subprocess

# Custom modules
from verify_filenames import rename
from preview import create_md_files

# configure path variables.
file_path = os.path.abspath(os.path.dirname(__file__))
base_path = os.path.abspath(os.path.dirname(file_path))
image_directory = os.path.join(base_path, "images", "color", "svg")
document_directory = os.path.join(base_path, "doc", "blog")
temp_directory = os.path.join(file_path, "temp")
svg_path = os.path.join(temp_directory, "openmoji")
negarmoji_emoji_json = os.path.join(temp_directory, "negarmoji.json")
negarmoji_filenames_json = os.path.join(temp_directory, "filenames.json")

# download latest files from negarmoji and openmoji repositories.
process = subprocess.run(["./downloader.sh"], stdout=subprocess.PIPE)

# update docs.
create_md_files(negarmoji_emoji_json, document_directory)

# verify filenames.
rename(svg_path, negarmoji_filenames_json)

# delete current svg in the image directory.
process = subprocess.run(["rm", "-rf", f"{image_directory}"], stdout=subprocess.PIPE)

# create new svg directory.
process = subprocess.run(["mkdir", "-p", f"{image_directory}"], stdout=subprocess.PIPE)

# move svg files from temp to image folder.
for file in os.listdir(svg_path):
    shutil.move(os.path.join(svg_path, file), image_directory)

# delete temp folder.
process = subprocess.run(["rm", "-rf", f"{temp_directory}"], stdout=subprocess.PIPE)
