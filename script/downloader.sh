#!/usr/bin/env bash

# shellcheck disable=SC2034
CURRDIR="$PWD"
COLOR_SVG_IMAGES="${PWD%/*}/images/color/svg"
TEMPDIR="temp"
TEMPZIP="$TEMPDIR/openmoji.zip"
TEMPUNZIP="$TEMPDIR/openmoji"

OPENMOJI_SVG=$(curl -s https://api.github.com/repos/hfg-gmuend/openmoji/releases/latest \
| grep "tag_name" \
| awk '{print "https://github.com/hfg-gmuend/openmoji/releases/download/" substr($2, 2, length($2)-3) "/openmoji-svg-color.zip"}') \

mkdir -p $TEMPDIR
mkdir -p $TEMPUNZIP

curl -L "$OPENMOJI_SVG" -o $TEMPZIP
curl -L "https://raw.githubusercontent.com/azadeh-afzar/Negareh-Emoji-Library/master/db/negarmoji.json" -o $TEMPDIR/negarmoji.json
curl -L "https://raw.githubusercontent.com/azadeh-afzar/Negareh-Emoji-Library/master/db/filenames.json" -o $TEMPDIR/filenames.json

unzip -qqo $TEMPZIP -d $TEMPUNZIP

rm -rf $TEMPZIP

for i in $(ls $TEMPUNZIP | grep "[A-Z]"); do mv -f $TEMPUNZIP/"$i" $TEMPUNZIP/"$( echo "$i" | tr "A-Z" "a-z")"; done
