$ZIP_NAME = "depotdownloader-2.3.4.zip"
$DEPO_DOWNLOADER_PATH = "depotdownloader"

$DOOM_ETERNAL_APP_ID = "782330"
$DEPOT__WINDOWS_EXECUTABLE = "782332"
$DEPOT__CONFIGS = "782333"
$DEPOT__SOUND = "782334"
$DEPOT__VIDEO = "782335"
$DEPOT__GAME_RESOURCES = "782336"
$DEPOT__LAUNCHER = "782339"

$game_path = Read-Host 'Enter a path for the game files'
$username = Read-Host 'Enter your Steam username'
$password = Read-Host 'Enter your Steam password' -AsSecureString

If (-Not (Test-Path -Path $DEPO_DOWNLOADER_PATH) -And -Not (Test-Path $ZIP_NAME)) {
    Write-Output "Downloading depodownloader"
    Invoke-WebRequest -Uri https://github.com/SteamRE/DepotDownloader/releases/download/DepotDownloader_2.3.4/$ZIP_NAME -OutFile $ZIP_NAME
}
else {
    Write-Output "Found depodownloader zip or installation; skipping download"
}
If (-Not (Test-Path $DEPO_DOWNLOADER_PATH)) {
    Write-Output "Unzipping $ZIP_NAME"
    Expand-Archive -Path $ZIP_NAME -DestinationPath $DEPO_DOWNLOADER_PATH
}
else {
    Write-Output "Found depodownloader installation; skipping unzip"
}

Write-Output "Creating $game_path if it does not already exist"
New-Item -Path $game_path -ItemType directory -Force

function FetchDowngrade($depot, $manifest) {
    DotNet ./$DEPO_DOWNLOADER_PATH/DepotDownloader.dll -app $DOOM_ETERNAL_APP_ID -depot $depot -manifest $manifest -username $username -password $password -dir $game_path
}

FetchDowngrade -depot $DEPOT__WINDOWS_EXECUTABLE -manifest 4641765937586464647
FetchDowngrade -depot $DEPOT__CONFIGS -manifest 4686311672633195957
FetchDowngrade -depot $DEPOT__SOUND -manifest 2624212357815850298
FetchDowngrade -depot $DEPOT__VIDEO -manifest 8671913471625122045
FetchDowngrade -depot $DEPOT__GAME_RESOURCES -manifest 4248922069342282231
FetchDowngrade -depot $DEPOT__LAUNCHER -manifest 8937962102049582968
