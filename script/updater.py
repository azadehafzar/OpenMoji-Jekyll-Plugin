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
temp_directory = os.path.join(file_path, "temp")
document_directory = os.path.join(base_path, "doc", "blog")
negarmoji_emoji_json = os.path.join(temp_directory, "negarmoji.json")
negarmoji_filenames_json = os.path.join(temp_directory, "filenames.json")

image_directory = os.path.join(base_path, "images")
color_image_directory = os.path.join(image_directory, "color")
black_image_directory = os.path.join(image_directory, "black")

openmoji_svg_color_path = os.path.join(temp_directory, "openmoji-svg-color")
openmoji_svg_black_path = os.path.join(temp_directory, "openmoji-svg-black")

# download latest files from negarmoji and openmoji repositories.
process = subprocess.run(["./downloader.sh"], stdout=subprocess.PIPE)

# verify filenames.
rename(openmoji_svg_color_path, "svg", negarmoji_filenames_json, 1)
rename(openmoji_svg_black_path, "svg", negarmoji_filenames_json, 2)

# delete current svg in the image directory.
process = subprocess.run(["rm", "-rf", f"{image_directory}"], stdout=subprocess.PIPE)

# create new directories.
process = subprocess.run(["mkdir", "-p", f"{color_image_directory}"], stdout=subprocess.PIPE)
process = subprocess.run(["mkdir", "-p", f"{black_image_directory}"], stdout=subprocess.PIPE)

# move from temp to destination directories.
shutil.move(openmoji_svg_color_path, os.path.join(color_image_directory, "svg"))
shutil.move(openmoji_svg_black_path, os.path.join(black_image_directory, "svg"))

# update preview pages site.
create_md_files(negarmoji_emoji_json, document_directory)

# delete temp folder.
process = subprocess.run(["rm", "-rf", f"{temp_directory}"], stdout=subprocess.PIPE)
