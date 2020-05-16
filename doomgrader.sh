#!/usr/bin/env bash

set -e

# doomgrader required config
STEAM_USERNAME=xxx
STEAM_PASSWORD=xxx

# doomgrader option config
DOOMGRADER_ROOT=~/doomgrader
STEAM_PATH=~/.steam/steam/steamapps/common

# doomgrader internal paths
DOWNLOAD_PATH=$DOOMGRADER_ROOT/files
DEPOTDOWNLOADER_PATH=$DOOMGRADER_ROOT/depotdownloader

# make doomgrader directories
mkdir -p $DOOMGRADER_ROOT $DOWNLOAD_PATH $DEPOTDOWNLOADER_PATH

# download, extract and make depotdownloader executable
pushd $DEPOTDOWNLOADER_PATH

wget \
https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.3.4/depotdownloader-2.3.4.zip \
-O depotdownloader_2.3.4.zip

unzip depotdownloader_2.3.4.zip 

chmod +x depotdownloader

# download the depots

./depotdownloader -app 782330 -depot 782332 -manifest 4641765937586464647 -username "$STEAM_USERNAME" -password "$STEAM_PASSWORD" -remember-password -dir "$DOWNLOAD_PATH"
./depotdownloader -app 782330 -depot 782333 -manifest 4686311672633195957 -username "$STEAM_USERNAME" -password "$STEAM_PASSWORD" -remember-password -dir "$DOWNLOAD_PATH"
./depotdownloader -app 782330 -depot 782334 -manifest 2624212357815850298 -username "$STEAM_USERNAME" -password "$STEAM_PASSWORD" -remember-password -dir "$DOWNLOAD_PATH"
./depotdownloader -app 782330 -depot 782335 -manifest 8671913471625122045 -username "$STEAM_USERNAME" -password "$STEAM_PASSWORD" -remember-password -dir "$DOWNLOAD_PATH"
./depotdownloader -app 782330 -depot 782336 -manifest 4248922069342282231 -username "$STEAM_USERNAME" -password "$STEAM_PASSWORD" -remember-password -dir "$DOWNLOAD_PATH"
./depotdownloader -app 782330 -depot 782339 -manifest 8937962102049582968 -username "$STEAM_USERNAME" -password "$STEAM_PASSWORD" -remember-password -dir "$DOWNLOAD_PATH"

# copy game files to steam dir
# coming soon
