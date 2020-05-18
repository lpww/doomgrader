#!/usr/bin/env bash

set -e

# doomgrader config
DOOMGRADER_ROOT=/run/media/nvme/.doomgrader/
STEAM_PATH=/run/media/nvme/SteamLibrary/steamapps/common/

# internal paths
DOWNLOAD_PATH=$DOOMGRADER_ROOT/files
DEPOTDOWNLOADER_PATH=$DOOMGRADER_ROOT/depotdownloader

# if statement to help skip downloading if not needed
if [[ $1 != "-c" ]]
then
    
    # prompt for steam credentials
    IFS=$'\n' # handle spaces in passwords
    read -p "Enter your Steam username:" STEAM_USERNAME
    read -s -p "Enter your Steam password:" STEAM_PASSWORD

    # make doomgrader directories
    mkdir -p $DOOMGRADER_ROOT $DOWNLOAD_PATH $DEPOTDOWNLOADER_PATH

    # change to depotdownloader directory
    pushd $DEPOTDOWNLOADER_PATH

    # download depotdownloader
    wget https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.3.4/depotdownloader-2.3.4.zip -O depotdownloader_2.3.4.zip

    # extract depotdownloader
    unzip depotdownloader_2.3.4.zip

    # make depotdownloader executable
    chmod +x depotdownloader

    # download the depots
    ./depotdownloader -app 782330 -depot 782332 -manifest 4641765937586464647 -username "$STEAM_USERNAME" -password "$STEAM_PASSWORD" -remember-password -dir "$DOWNLOAD_PATH"
    ./depotdownloader -app 782330 -depot 782333 -manifest 4686311672633195957 -username "$STEAM_USERNAME" -password "$STEAM_PASSWORD" -remember-password -dir "$DOWNLOAD_PATH"
    ./depotdownloader -app 782330 -depot 782334 -manifest 2624212357815850298 -username "$STEAM_USERNAME" -password "$STEAM_PASSWORD" -remember-password -dir "$DOWNLOAD_PATH"
    ./depotdownloader -app 782330 -depot 782335 -manifest 8671913471625122045 -username "$STEAM_USERNAME" -password "$STEAM_PASSWORD" -remember-password -dir "$DOWNLOAD_PATH"
    ./depotdownloader -app 782330 -depot 782336 -manifest 4248922069342282231 -username "$STEAM_USERNAME" -password "$STEAM_PASSWORD" -remember-password -dir "$DOWNLOAD_PATH"
    ./depotdownloader -app 782330 -depot 782339 -manifest 8937962102049582968 -username "$STEAM_USERNAME" -password "$STEAM_PASSWORD" -remember-password -dir "$DOWNLOAD_PATH"

fi

# copy game files to steam dir
echo "Copying the game from $DOWNLOAD_PATH to $STEAM_PATH/DOOMEternal/"
read -p "Is this correct (y/n)?: " DOOMGRADER_ANSWER

if [[ $DOOMGRADER_ANSWER == 'Y' || $DOOMGRADER_ANSWER == "yes" || $DOOMGRADER_ANSWER == "YES" || $DOOMGRADER_ANSWER == "y" ]]
then
   \cp $DOWNLOAD_PATH/* $STEAM_PATH/DOOMEternal/ -rf
else
    echo "Copying of files stopped!"
fi
