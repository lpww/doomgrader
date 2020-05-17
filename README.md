# doomgrader
Downgrade Doom Eternal on Steam to the pre anti-cheat version

## Overview
This script can be used by Linux gamers to downgrade Doom Eternal to the pre anti
cheat [version](https://steamdb.info/patchnotes/4811158/). This will make the single player game playable again for linux
users who bought the game on Steam and were screwed over by the anti cheat update. This script
is an automation of steps put together by Campbell Jones. The original document can be
found
[here](https://docs.google.com/document/d/1iugtqVUuG8TsnZyRzBV-QamdbygdSEGJzOSkDFGpgJU/edit)


## What does it do?

1. Gets [DepotDownloader](https://github.com/SteamRE/DepotDownloader), a program for downloading old versions of games from the [steamdb](https://steamdb.info)
2. Downloads the most recent [working version](https://steamdb.info/patchnotes/4811158/) of the game
3. Copies the old game files to your Steam directory so you are ready to play
   (coming soon - the files must be manually copied right now)

## Installation

1. Clone this repo `git clone https://github.com/lpww/doomgrader.git`
2. Change directory `cd doomgrader`

## Prerequisites

- A fully updated Steam version of Doom Eternal
- .NET Core: See [here](https://wiki.archlinux.org/index.php/.NET_Core) for more
  information. Don't forget to add `~/.dotnet/tools` to your PATH.

## Config

Variables must be changed by editing the script before execution

- `DOOMGRADER_ROOT`: This is where doomgrader will store files. Games files will live in `$DOOMGRADER_ROOT/files`. DepotDownloader will live in `$DOOMGRADER_ROOT/depotdownloader`

  Defaults to `~/doomgrader`
- `STEAM_PATH`: You will only need to change this if you have changed your steam games directory

  Defaults to the normal steam dir `~/.steam/steam/steamapps/common`

## Run the script

1. Make the script executable `chmod +x doomgrader.sh`
2. Run the script `./doomgrader.sh`
3. Enter your Steam credentials when prompted (works with Steam Guard)
4. Wait for the download to complete (this can take a very long time)

## Running the game

You should be able to run the game with Steam as normal. If a new update is
released that doesn't fix the game, you will need to do the copy step again to
replace the new games files with the working version

## Cleanup

Remove all associated files by deleting the DOOMGRADER_ROOT. Eg `rm -rf
~/doomgrader`. This will remove all games files as well as DepotDownloader

Remove just the DepotDownloader files by deleting DOOMGRADER_ROOT/depotdownloader. Eg `rm
-rf ~/doomgrader/depotdownloader`

Remove just the game files by deleting DOOMGRADER_ROOT/files. Eg `rm -rf
~/doomgrader/files`
