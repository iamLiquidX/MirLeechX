No support is going to be provided of any kind, only maintaining this for vps user on request.

This is a Telegram Bot written in Python for mirroring files on the Internet to your Google Drive or Telegram. Based on [python-aria-mirror-bot](https://github.com/lzzy12/python-aria-mirror-bot)

# Features:

## By me
- qBittorrent
- Select files from Torrent before downloading using qbittorrent
- Leech (splitting, thumbnail for each user, setting as document or as media for each user)
- Size limiting for Torrent/Direct, Zip/Unzip, Mega and Clone
- Stop duplicates for all tasks except youtube-dl tasks 
- Zip/Unzip G-Drive links
- Counting files/folders from Google Drive link
- View Link button, extra button to open file index link in broswer instead of direct download
- Status Pages for unlimited tasks
- Clone status
- Search in multiple Drive folder/TeamDrive
- Recursive Search (only with `root` or TeamDrive ID, folder ids will be skipped)
- Multi-Search by token.pickle if exists 
- Extract rar, zip and 7z splits with or without password
- Zip file/folder with or without password
- Use Toke.pickle if file not found with Service Account
- Random Service Account at startup
- Mirror/Leech by reply (soon will add for watch and clone)
- Search for torrents with variable plugins using qBittorrent search engine
- Many bugs has been fixed

## From official and Other Repositories
- Mirror direct download links, Torrent, and Telegram files to Google Drive
- Mirror Mega.nz links to Google Drive (If you have non-premium Mega account, it will limit download to 5GB per 6 hours)
- Copy files from someone's Drive to your Drive (Using Autorclone)
- Download/Upload progress, Speeds and ETAs
- Mirror all Youtube-dl supported links
- Docker support
- Uploading to Team Drive
- Index Link support
- Service Account support
- Delete files from Drive
- Shortener support
- Speedtest
- Multiple Trackers support
- Shell and Executor
- Sudo with or without Database
- Custom Filename (Only for direct links, Telegram files and Youtube-dl. Not for Mega links, Gdrive links or Torrents)
- Extract or Compress password protected files.
- Extract these filetypes and uploads to Google Drive
```
ZIP, RAR, TAR, 7z, ISO, WIM, CAB, GZIP, BZIP2, 
APM, ARJ, CHM, CPIO, CramFS, DEB, DMG, FAT, 
HFS, LZH, LZMA, LZMA2, MBR, MSI, MSLZ, NSIS, 
NTFS, RPM, SquashFS, UDF, VHD, XAR, Z, tar.xz
```
- Direct links Supported:
```
letsupload.io, hxfile.co, anonfiles.com, bayfiles.com, antfiles,
fembed.com, fembed.net, femax20.com, layarkacaxxi.icu, fcdn.stream,
sbplay.org, naniplay.com, naniplay.nanime.in, naniplay.nanime.biz, sbembed.com,
streamtape.com, streamsb.net, feurl.com, pixeldrain.com, racaty.net,
1fichier.com, 1drv.ms (Only works for file not folder or business account),
uptobox.com (Uptobox account must be premium), solidfiles.com
```
**See these examples for custom filename, Extract/Compress password protected files and downlaod from protected links**
<p><a href="https://telegra.ph/Magneto-Python-Aria---Custom-Filename-Examples-01-20"> <img src="https://img.shields.io/badge/See%20Telegraph-grey?style=for-the-badge&logo=telegraph" width="170""/></a></p>

# How to deploy?
Deploying is pretty much straight forward and is divided into several steps as follows:
## Installing requirements

- Clone this repo:
```
git clone https://github.com/anasty17/mirror-leech-telegram-bot mirrorbot/ && cd mirrorbot
```

- Install requirements
For Debian based distros
```
sudo apt install python3
```
Install Docker by following the [official Docker docs](https://docs.docker.com/engine/install/debian/)

OR
```
sudo snap install docker
```
- For Arch and it's derivatives:
```
sudo pacman -S docker python
```
- Install dependencies for running setup scripts:
```
pip3 install -r requirements-cli.txt
```
## Generate Database
<details>
    <summary><b>Click Here For More Details</b></summary>

**1. Using ElephantSQL**
- Go to https://elephantsql.com and create account (skip this if you already have **ElephantSQL** account)
- Hit `Create New Instance`
- Follow the further instructions in the screen
- Hit `Select Region`
- Hit `Review`
- Hit `Create instance`
- Select your database name
- Copy your database url, and fill to `DATABASE_URL` in config

**2. Using Heroku PostgreSQL**
<p><a href="https://dev.to/prisma/how-to-setup-a-free-postgresql-database-on-heroku-1dc1"> <img src="https://img.shields.io/badge/See%20Dev.to-black?style=for-the-badge&logo=dev.to" width="160""/></a></p>

</details>

## Setting up config file

```
cp config_sample.env config.env
```
- Remove the first line saying:
```
_____REMOVE_THIS_LINE_____=True
```
Fill up rest of the fields. Meaning of each field is discussed below:
### Required Field
- `BOT_TOKEN`: The Telegram Bot Token that you got from [@BotFather](https://t.me/BotFather)
- `TELEGRAM_API`: This is to authenticate your Telegram account for downloading Telegram files. You can get this from https://my.telegram.org. **NOTE**: DO NOT put this in quotes.
- `TELEGRAM_HASH`: This is to authenticate your Telegram account for downloading Telegram files. You can get this from https://my.telegram.org
- `OWNER_ID`: The Telegram User ID (not username) of the Owner of the bot
- `GDRIVE_FOLDER_ID`: This is the folder ID of the Google Drive Folder to which you want to upload all the mirrors.
- `DOWNLOAD_DIR`: The path to the local folder where the downloads should be downloaded to
- `DOWNLOAD_STATUS_UPDATE_INTERVAL`: A short interval of time in seconds after which the Mirror progress/status message is updated. (I recommend to keep it to `7` seconds at least)  
- `AUTO_DELETE_MESSAGE_DURATION`: Interval of time (in seconds), after which the bot deletes it's message (and command message) which is expected to be viewed instantly. (**NOTE**: Set to `-1` to never automatically delete messages)
- `BASE_URL_OF_BOT`: (Required for Heroku to avoid sleep/idling) Valid BASE URL of app where the bot is deployed. Format of URL should be `http://myip` (where `myip` is the IP/Domain of your bot) or if you have chosen other port than `80` then fill in this format `http://myip:port`, for Heroku fill `https://yourappname.herokuapp.com` (**NOTE**: Do not put slash at the end), still got idling? You can use http://cron-job.org to ping your Heroku app.
### Optional Field
- `ACCOUNTS_ZIP_URL`: Only if you want to load your Service Account externally from an Index Link. Archive the accounts folder to a zip file. Fill this with the direct link of that file.
- `TOKEN_PICKLE_URL`: Only if you want to load your **token.pickle** externally from an Index Link. Fill this with the direct link of that file.
- `MULTI_SEARCH_URL`: Check `drive_folder` setup [here](https://github.com/anasty17/mirror-leech-telegram-bot/tree/master#multi-search-ids). Upload **drive_folder** file [here](https://gist.github.com/). Open the raw file of that gist, it's URL will be your required variable.
- `DATABASE_URL`: Your Database URL. See [Generate Database](https://github.com/anasty17/mirror-leech-telegram-bot/tree/master#generate-database) to generate database (**NOTE**: If you use database you can save your Sudo ID permanently using `/addsudo` command).
- `AUTHORIZED_CHATS`: Fill user_id and chat_id (not username) of groups/users you want to authorize. Separate them with space, Examples: `-0123456789 -1122334455 6915401739`.
- `SUDO_USERS`: Fill user_id (not username) of users whom you want to give sudo permission. Separate them with space, Examples: `0123456789 1122334455 6915401739` (**NOTE**: If you want to save Sudo ID permanently without database, you must fill your Sudo Id here).
- `IS_TEAM_DRIVE`: Set to `True` if `GDRIVE_FOLDER_ID` is from a Team Drive else `False` or Leave it empty. `Bool`
- `USE_SERVICE_ACCOUNTS`: (Leave empty if unsure) Whether to use Service Accounts or not. For this to work see [Using Service Accounts](https://github.com/anasty17/mirror-leech-telegram-bot#generate-service-accounts-what-is-service-account) section below.
- `INDEX_URL`: Refer to https://gitlab.com/ParveenBhadooOfficial/Google-Drive-Index The URL should not have any trailing '/'
- `MEGA_API_KEY`: Mega.nz API key to mirror mega.nz links. Get it from [Mega SDK Page](https://mega.nz/sdk)
- `MEGA_EMAIL_ID`: Your E-Mail ID used to sign up on mega.nz for using premium account (Leave though)
- `MEGA_PASSWORD`: Your Password for your mega.nz account
- `BLOCK_MEGA_FOLDER`: If you want to remove mega.nz folder support, set it to `True`. `Bool`
- `BLOCK_MEGA_LINKS`: If you want to remove mega.nz mirror support, set it to `True`. `Bool`
- `STOP_DUPLICATE`: (Leave empty if unsure) if this field is set to `True`, bot will check file in Drive, if it is present in Drive, downloading or cloning will be stopped. (**NOTE**: File will be checked using filename not file hash, so this feature is not perfect yet). `Bool`
- `CLONE_LIMIT`: To limit the size of Google Drive folder/file which you can clone. Don't add unit, the default unit is `GB`.
- `MEGA_LIMIT`: To limit the size of Mega download. Don't add unit, the default unit is `GB`.
- `TORRENT_DIRECT_LIMIT`: To limit the Torrent/Direct mirror size. Don't add unit, the default unit is `GB`.
- `TAR_UNZIP_LIMIT`: To limit the size of mirroring as Tar or unzipmirror. Don't add unit, the default unit is `GB`.
- `VIEW_LINK`: View Link button to open file Index Link in browser instead of direct download link, you can figure out if it's compatible with your Index code or not, open any video from you Index and check if its URL ends with `?a=view`, if yes make it `True` it will work (Compatible with https://gitlab.com/ParveenBhadooOfficial/Google-Drive-Index Code). `Bool`
- `UPTOBOX_TOKEN`: Uptobox token to mirror uptobox links. Get it from [Uptobox Premium Account](https://uptobox.com/my_account).
- `IGNORE_PENDING_REQUESTS`: If you want the bot to ignore pending requests after it restarts, set this to `True`. `Bool`
- `STATUS_LIMIT`: Limit the no. of tasks shown in status message with button. (**NOTE**: Recommended limit is `4` tasks at max).
- `IS_VPS`: (Only for VPS) Don't set this to `True` even if you are using VPS, unless facing error with web server. `Bool`
- `SERVER_PORT`: Only For VPS even if `IS_VPS` is `False` --> Base URL Port
- `RECURSIVE_SEARCH`: Set this to `True` to search in sub-folders with `/list` (**NOTE**: This will only work with Shared-Drive ID or fill `root` for main Drive. Folder IDs are not compatible with it.)
- `TG_SPLIT_SIZE`: Size of split in bytes, leave it empty for max size `2GB`.
- `AS_DOCUMENT`: Default Telegram file type upload. Empty or `False` means as media. `Bool`
- `EQUAL_SPLITS`: Split files larger than **TG_SPLIT_SIZE** into equal parts size. `Bool`
- `CUSTOM_FILENAME`: Add custom word to leeched file name.
- `SHORTENER_API`: Fill your Shortener API key.
- `SHORTENER`: Shortener URL.
Supported URL Shorteners:
```
exe.io, gplinks.in, shrinkme.io, urlshortx.com, shortzon.com, bit.ly,
shorte.st, linkvertise.com , ouo.io
```
- `SEARCH_PLUGINS`: List of qBittorrent search plugins (github raw links). I have added some plugins, you can remove/add plugins as you want. Main Source: [qBittorrent Search Plugins (Official/Unofficial)](https://github.com/qbittorrent/search-plugins/wiki/Unofficial-search-plugins) (**NOTE**: Many plugins will leads to slow search process).

### Add more buttons (Optional Field)
Three buttons are already added including Drive Link, Index Link, and View Link, you can add extra buttons, if you don't know what are the below entries, simply leave them empty.
- `BUTTON_FOUR_NAME`:
- `BUTTON_FOUR_URL`:
- `BUTTON_FIVE_NAME`:
- `BUTTON_FIVE_URL`:
- `BUTTON_SIX_NAME`:
- `BUTTON_SIX_URL`:

## Bot commands to be set in [@BotFather](https://t.me/BotFather)

```
mirror - Start mirroring
zip - Start mirroring and upload as .zip
unzip - Extract files
qbmirror - Start mirroring using qBittorrent
qbzipmirror - Start mirroring and upload as .zip using qb
qbunzipmirror - Extract files using qBittorrent
leech - Leech Torrent/Direct link
zipleech - Leech Torrent/Direct link and upload as .zip
unzipleech - Leech Torrent/Direct link and extract
qbleech - Leech Torrent/Magnet using qBittorrent
qbzipleech - Leech Torrent/Magnet and upload as .zip using qb
qbunzipleech - Leech Torrent and extract using qb
clone - Copy file/folder to Drive count - Count file/folder of Drive link
watch - Mirror Youtube-dl supported link
zipwatch - Mirror Youtube playlist link and upload as .zip
leechwatch - Leech through Youtube-dl supported link
leechzipwatch - Leech Youtube playlist link and upload as .zip
leechset - Leech settings
setthumb - Set Thumbnail
status - Get Mirror Status message
list - [query] Search files in Drive
search - [query] Search for torrents with installed qbittorrent search plugins
cancel - Cancel a task
cancelall - Cancel all tasks
del - [drive_url] Delete file from Drive
log - Get the Bot Log [owner/sudo only]
shell - Run commands in Shell [owner only]
restart - Restart the Bot [owner/sudo only]
stats - Bot Usage Stats
ping - Ping the Bot
help - All cmds with description
```

## Getting Google OAuth API credential file
- Visit the [Google Cloud Console](https://console.developers.google.com/apis/credentials)
- Go to the OAuth Consent tab, fill it, and save.
- Go to the Credentials tab and click Create Credentials -> OAuth Client ID
- Choose Desktop and Create.
- Use the download button to download your credentials.
- Move that file to the root of mirrorbot, and rename it to **credentials.json**
- Visit [Google API page](https://console.developers.google.com/apis/library)
- Search for Drive and enable it if it is disabled
- Finally, run the script to generate **token.pickle** file for Google Drive:
```
pip install google-api-python-client google-auth-httplib2 google-auth-oauthlib
python3 generate_drive_token.py
```
## Deploying On VPS

**IMPORTANT NOTE**: You must set `SERVER_PORT` variable to `80` or any other port you want to use.

- Start Docker daemon (skip if already running):
```
sudo dockerd
```
- Build Docker image:
```
sudo docker build . -t mirror-bot
```
- Run the image:
```
sudo docker run -p 80:80 mirror-bot
```
### OR

### Using Docker-compose, you can edit and build your image in seconds:

**NOTE**: If you want to use port other than 80, change it in [docker-compose.yml](https://github.com/anasty17/mirror-leech-telegram-bot/blob/master/docker-compose.yml)

```
sudo apt install docker-compose
```
- Build and run Docker image:
```
sudo docker-compose up
```
- After editing files with nano for example (nano start.sh):
```
sudo docker-compose build
sudo docker-compose up
```
OR
```
sudo docker-compose up --build
```
- To stop Docker: 
```
sudo docker ps
```
```
sudo docker stop id
```
- To clear the container (this will not affect the image):
```
sudo docker container prune
```
- To delete the image:
```
sudo docker image prune -a
```
- Tutorial video from Tortoolkit repo
<p><a href="https://youtu.be/c8_TU1sPK08"> <img src="https://img.shields.io/badge/See%20Video-black?style=for-the-badge&logo=YouTube" width="160""/></a></p>

## Deploying on Heroku
- Deploying on Heroku with Github Workflow
<p><a href="https://telegra.ph/Heroku-Deployment-10-04"> <img src="https://img.shields.io/badge/Deploy%20Guide-blueviolet?style=for-the-badge&logo=heroku" width="170""/></a></p>

- Deploying on Heroku with heroku-cli and Goorm IDE
<p><a href="https://telegra.ph/How-to-Deploy-a-Mirror-Bot-to-Heroku-with-CLI-05-06"> <img src="https://img.shields.io/badge/Deploy%20Guide-grey?style=for-the-badge&logo=telegraph" width="170""/></a></p>

# Using Service Accounts for uploading to avoid user rate limit
For Service Account to work, you must set `USE_SERVICE_ACCOUNTS` = "True" in config file or environment variables.
**NOTE**: Using Service Accounts is only recommended while uploading to a Team Drive.

## Generate Service Accounts. [What is Service Account](https://cloud.google.com/iam/docs/service-accounts)
Let us create only the Service Accounts that we need. 
**Warning**: Abuse of this feature is not the aim of this project and we do **NOT** recommend that you make a lot of projects, just one project and 100 SAs allow you plenty of use, its also possible that over abuse might get your projects banned by Google.

**NOTE**: If you have created SAs in past from this script, you can also just re download the keys by running:
```
python3 gen_sa_accounts.py --download-keys project_id
```

**NOTE:** 1 Service Account can upload/copy around 750 GB a day, 1 project can make 100 Service Accounts so you can upload 75 TB a day or clone 2 TB from each file creator (uploader email).

**NOTE:** Add Service Accounts to team drive or google group no need to add them in both.

### Create Service Accounts to Current Project (Recommended Method)
- List your projects ids
```
python3 gen_sa_accounts.py --list-projects
```
- Enable services automatically by this command
```
python3 gen_sa_accounts.py --enable-services $PROJECTID
```
- Create Sevice Accounts to current project
```
python3 gen_sa_accounts.py --create-sas $PROJECTID
```
- Download Sevice Accounts as accounts folder
```
python3 gen_sa_accounts.py --download-keys $PROJECTID
```

### Another Quick Method
```
python3 gen_sa_accounts.py --quick-setup 1 --new-only
```
A folder named accounts will be created which will contain keys for the Service Accounts.

#### Add Service Accounts to Google Group
- Mount accounts folder
```
cd accounts
```
- Grab emails form all accounts to emails.txt file that would be created in accounts folder
```
grep -oPh '"client_email": "\K[^"]+' *.json > emails.txt
```
- Unmount acounts folder
```
cd -
```
Then add emails from emails.txt to Google Group, after that add this Google Group to your Shared Drive and promote it to manager.

#### Add Service Accounts to the Team Drive
- Run:
```
python3 add_to_team_drive.py -d SharedTeamDriveSrcID
```

# Multi Search IDs
To use list from multi TD/folder. Run driveid.py in your terminal and follow it. It will generate **drive_folder** file or u can simply create `drive_folder` file in working directory and fill it, check below format:
```
MyTdName folderID/tdID IndexLink(if available)
MyTdName2 folderID/tdID IndexLink(if available)
```

# Youtube-dl and Index Authentication Using .netrc File
For using your premium accounts in Youtube-dl or for protected Index Links, edit the netrc file according to following format:
```
machine host login username password my_youtube_password
```
For Index Link with only password without username, even http auth will not work, so this is the solution.
```
machine example.workers.dev password index_password
```
Where host is the name of extractor (eg. Youtube, Twitch). Multiple accounts of different hosts can be added each separated by a new line.

