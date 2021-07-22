#!/usr/bin/env bash

CURRDIR="${PWD}"
TEMPDIR="temp"

# Create download link.
OMP_VERSION=$(curl --silent https://api.github.com/repos/hfg-gmuend/openmoji/releases/latest \
| grep "tag_name" \
| awk '{print "" substr($2, 2, length($2)-3)}')

OMP_SVG_COLOR_DOWNLOAD_LINK="https://github.com/hfg-gmuend/openmoji/releases/download/${OMP_VERSION}/openmoji-svg-color.zip"
OMP_SVG_BLACK_DOWNLOAD_LINK="https://github.com/hfg-gmuend/openmoji/releases/download/${OMP_VERSION}/openmoji-svg-black.zip"

# Setup paths.
OMP_SVG_COLOR_ZIP="${TEMPDIR}/openmoji-svg-color.zip"
OMP_SVG_COLOR_DIR="${TEMPDIR}/openmoji-svg-color"

OMP_SVG_BLACK_ZIP="${TEMPDIR}/openmoji-svg-black.zip"
OMP_SVG_BLACK_DIR="${TEMPDIR}/openmoji-svg-black"

# create dirs.
mkdir --parents "${TEMPDIR}"

# Download.
curl -L "https://raw.githubusercontent.com/azadeh-afzar/Negareh-Emoji-Library/master/db/negarmoji.json" -o "${TEMPDIR}/negarmoji.json"
curl -L "https://raw.githubusercontent.com/azadeh-afzar/Negareh-Emoji-Library/master/db/filenames.json" -o "${TEMPDIR}/filenames.json"

wget --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 \
--tries 0 --no-dns-cache --output-document "${OMP_SVG_COLOR_ZIP}" "${OMP_SVG_COLOR_DOWNLOAD_LINK}"

wget --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 \
--tries 0 --no-dns-cache --output-document "${OMP_SVG_BLACK_ZIP}" "${OMP_SVG_BLACK_DOWNLOAD_LINK}"

# unzip.
unzip -qqo "${OMP_SVG_COLOR_ZIP}" -d "${OMP_SVG_COLOR_DIR}"
unzip -qqo "${OMP_SVG_BLACK_ZIP}" -d "${OMP_SVG_BLACK_DIR}"

# remove zips.
rm --force --recursive "${OMP_SVG_COLOR_ZIP}"
rm --force --recursive "${OMP_SVG_BLACK_ZIP}"

printf "\nConverting names to lower case. please wait.\n\n"

# convert names from capital case to lower case. (bypass ls alias by \ls)
for i in $(\ls "${OMP_SVG_COLOR_DIR}" | grep "[[:upper:]]"); do mv --force "${OMP_SVG_COLOR_DIR}/${i}" "${OMP_SVG_COLOR_DIR}/$( echo "${i}" | tr "[:upper:]" "[:lower:]")"; done
for i in $(\ls "${OMP_SVG_BLACK_DIR}" | grep "[[:upper:]]"); do mv --force "${OMP_SVG_BLACK_DIR}/${i}" "${OMP_SVG_BLACK_DIR}/$( echo "${i}" | tr "[:upper:]" "[:lower:]")"; done

printf "\nOptimizing SVG files. please wait.\n\n"

# use svgo to optimize svg files.
svgo --multipass --quiet --recursive --folder "${OMP_SVG_COLOR_DIR}"
svgo --multipass --quiet --recursive --folder "${OMP_SVG_BLACK_DIR}"
