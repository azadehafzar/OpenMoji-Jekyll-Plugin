#!/usr/bin/env python3

import json
import re
import os

def rename(svg_path, negarmoji_filename_json):
    # load filenames from negarmoji.
    with open(negarmoji_filename_json, "rb") as file:
        negarmoji_filenames = set(json.load(file))

    # get list of svg file names.
    svg_filenames = set([file for file in os.listdir(svg_path) if os.path.isfile(os.path.join(svg_path, file))])

    # find differences in filenames.
    differences = svg_filenames - negarmoji_filenames

    # try to solve differences with removing -200d and -fe0f from filenames.
    for file in differences:
        os.rename(os.path.join(svg_path, file), os.path.join(svg_path, re.sub(re.compile("-(200d|fe0f)"), "", file)))

    # get list of new svg file names.
    svg_filenames = set([file for file in os.listdir(svg_path) if os.path.isfile(os.path.join(svg_path, file))])

    # check if any different file name still exists.
    differences = svg_filenames - negarmoji_filenames

    if len(differences):
        print("Error: different file name still exists!")
        print("different filenames:")
        for filename in differences:
            print(filename)
