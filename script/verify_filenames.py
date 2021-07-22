#!/usr/bin/env python3

import json
import re
import os

def rename(image_path, extension_format, negarmoji_filename_json, rename_id):
    # load filenames from negarmoji.
    with open(negarmoji_filename_json, "rb") as file:
        negarmoji_filenames = set(item.replace(f".{extension_format}", "") for item in json.load(file))

    # get list of image file names.
    image_filenames = set([
        file.replace(f".{extension_format}", "") for file in os.listdir(image_path)
        if (
            os.path.isfile(os.path.join(image_path, file))
            and
            os.path.join(image_path, file).lower().endswith(f".{extension_format}")
        )
    ])

    # find differences in filenames.
    differences = image_filenames - negarmoji_filenames

    # try to solve differences with removing -200d and -fe0f from filenames.
    for file in differences:
        file_with_extension = file + f".{extension_format}"
        os.rename(
            os.path.join(image_path, file_with_extension),
            os.path.join(
                image_path, re.sub(re.compile("-(200d|fe0f)"), "", file_with_extension)
            )
        )

    # get list of new image file names.
    image_filenames = set([
        file.replace(f".{extension_format}", "") for file in os.listdir(image_path)
        if (
            os.path.isfile(os.path.join(image_path, file))
            and
            os.path.join(image_path, file).lower().endswith(f".{extension_format}")
        )
    ])

    # check if any different file name still exists.
    differences = image_filenames - negarmoji_filenames

    if len(differences):
        print(f"Rename ID: {rename_id}")
        print("Error: different file name still exists!")
        print(f"different filenames count: {len(differences)}\n")
