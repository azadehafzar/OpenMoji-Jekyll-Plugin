#!/usr/bin/env python3

import codecs
import copy
import json
import os

from collections import defaultdict

def create_md_files(negarmoji_json, doc_path):
    # read negarmoji json file as binary to correctly import all
    # emoji characters.
    with open(negarmoji_json, "rb") as file:
        emoji_dict = json.load(file)

    # create a dictionary with list as a default value for all keys.
    # this dictionary maps each category to a list of aliases of emojis
    # corresponding to that category.
    alias_by_category = defaultdict(list)

    # add each alias of an emoji to a list mapped to emoji's category.
    for item in emoji_dict:
        for alias in item["aliases"]:
    	    alias_by_category[item["category"]].append(alias)

    # bare minimum template for md files.
    template = "---\nlayout: page\ntitle: {}\npermalink: /{}/\n---"

    # process each category.
    for category, aliases in alias_by_category.items():
        # empty md file list, combining this list will create final text.
        md_file = list()

        # shorten category name for page title.
        category_title = category.split()[0]

        # create permalink path for this category.
        category_permalink = category.replace(' ', '').replace('&', '-')

        # filter special case.
        if category_title == "Extras":
            category_title = category.split()[2]

        # format template with this category.
        head = template.format(category_title, category_permalink)

        # append head and category name to md file.
        md_file.append(head)
        md_file.append(f"## {category}")

        # sort aliases alphabetically.
        aliases.sort(key=str.lower)

        # create an entry for each alias.
        for alias in aliases:
            md_file.append(f":{alias}: ")
            md_file.append(f"`:{alias}:` ")
            md_file.append("\n")

        # write data to file.
        with open(os.path.join(doc_path, f"{category_title}.md"), "w") as file:
            file.write("\n".join(md_file))
