# doomgrader
Downgrade Doom Eternal to the pre anti-cheat version

## Overview
This script can be used by Linux users to downgrade Doom Eternal to the pre anti
cheat version. This will make the single player game playable again for linux
users who bought the game and were screwed over by the anti cheat update. This script
is an automation of steps put together by Campbell Jones. The original document can be
found
[here](https://docs.google.com/document/d/1iugtqVUuG8TsnZyRzBV-QamdbygdSEGJzOSkDFGpgJU/edit)

## Installation

1. Clone this repo `git clone https://github.com/lpww/doomgrader.git`
2. Change directory `cd doomgrader`

## Prereqquisites

- .NET Core: See [here](https://wiki.archlinux.org/index.php/.NET_Core) for more
  information. Don't forget to add `~/.dotnet/tools` to your PATH.

## Config

Variables must be changed by editing the script before execution

### Required

- `STEAM_USERNAME`: Your Steam username
- `STEAM_PASSWORD`: Your Steam password

### Optional

- `DOOMGRADER_ROOT`: This is where doomgrader will store depotdownloader as well
  as the game files. Defaults to `~/doomgrader`
- `DOOMGRADER_PATH`: This is where the game files will download to. Defaults to
  `~/doomgrader/files`
- `DEPOTDOWNLOADER_PATH`: This is where the DepotDownloader files will download
   to. This folder can be safely deleted after running the script if you don't
   want to keep DepotDownloader. Defaults to `~/doomgrader/depotdownloader`
- `STEAM_PATH`: You will only need to change this if you have changed your steam games directory. Defaults to the normal steam dir `~/.steam/steam/steamapps/common`

## Run the script

1. Make the script executable `chmod +x doomgrader.sh`
2. Run the script `./doomgrader.sh`

## Copy the game files

...coming soon...


## Running the game

You should be able to run the game with Steam as normal. If a new update is
released that doesn't fix the game, you will need to do the copy step again to
replace the new games files with the working version
