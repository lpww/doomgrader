#!/usr/bin/env bash

set -e

# doomgrader config; EDIT HERE!
DOOMGRADER_ROOT=~/doomgrader
STEAM_PATH=~/.steam/steam/steamapps/common

# internal paths
DOWNLOAD_PATH=$DOOMGRADER_ROOT/files
DEPOTDOWNLOADER_PATH=$DOOMGRADER_ROOT/depotdownloader

# function for copying files with prompt
DOOMGRADER_COPY()
{
# copy game files to steam dir
echo "Copying the game from $DOWNLOAD_PATH to $STEAM_PATH/DOOMEternal/"
echo "THIS WILL OVERWRITE YOUR EXISTING DOOM ETERNAL GAME FILES!"
read -p "Is this correct (y/n)?: " DOOMGRADER_ANSWER

if [[ $DOOMGRADER_ANSWER == 'Y' || $DOOMGRADER_ANSWER == "yes" || $DOOMGRADER_ANSWER == "YES" || $DOOMGRADER_ANSWER == "y" ]]
then
    cp $DOWNLOAD_PATH/* $STEAM_PATH/DOOMEternal/ -rfv
else
    echo "Copying of files stopped!"
    echo "No files were copied or overwritten!"
fi
}

# if the "-c" option/flag is passed, then just do the copy and finish
if [[ $1 == "-c" ]]
then
DOOMGRADER_COPY
exit 0
fi

# handles downloading depotdownloader and downloading the old version of Doom Eternal
# prompt for steam credentials, no need to edit in the script
IFS=$'\n' # handle spaces in passwords
read -p "Enter your Steam username:" STEAM_USERNAME
read -s -p "Enter your Steam password:" STEAM_PASSWORD

# make doomgrader directories
mkdir -p $DOOMGRADER_ROOT $DOWNLOAD_PATH $DEPOTDOWNLOADER_PATH

# change to depotdownloader directory
pushd $DEPOTDOWNLOADER_PATH

# download depotdownloader
curl https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.3.4/depotdownloader-2.3.4.zip -o depotdownloader_2.3.4.zip -L

# extract depotdownloader
unzip depotdownloader_2.3.4.zip

# make depotdownloader executable
chmod +x depotdownloader

# replace dotnet dependency with mono
sed -i 's/dotnet/mono/' depotdownloader

# download the depots
./depotdownloader -app 782330 -depot 782332 -manifest 4641765937586464647 -username "$STEAM_USERNAME" -password "$STEAM_PASSWORD" -remember-password -dir "$DOWNLOAD_PATH"
./depotdownloader -app 782330 -depot 782333 -manifest 4686311672633195957 -username "$STEAM_USERNAME" -password "$STEAM_PASSWORD" -remember-password -dir "$DOWNLOAD_PATH"
./depotdownloader -app 782330 -depot 782334 -manifest 2624212357815850298 -username "$STEAM_USERNAME" -password "$STEAM_PASSWORD" -remember-password -dir "$DOWNLOAD_PATH"
./depotdownloader -app 782330 -depot 782335 -manifest 8671913471625122045 -username "$STEAM_USERNAME" -password "$STEAM_PASSWORD" -remember-password -dir "$DOWNLOAD_PATH"
./depotdownloader -app 782330 -depot 782336 -manifest 4248922069342282231 -username "$STEAM_USERNAME" -password "$STEAM_PASSWORD" -remember-password -dir "$DOWNLOAD_PATH"
./depotdownloader -app 782330 -depot 782339 -manifest 8937962102049582968 -username "$STEAM_USERNAME" -password "$STEAM_PASSWORD" -remember-password -dir "$DOWNLOAD_PATH"

# now copy the files downloaded from depotdownloader into your steam directory
echo "" # adds space between depot downloader output and DOOMGRADER_COPY prompt
DOOMGRADER_COPY

