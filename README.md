# Server files for running a Longvinter server.

If you have any trouble following the guide. Please send us a message in [Discord](https://discord.gg/SmPZ8hRqMV) we are more than happy to help you out!

### This guide is made with Ubuntu 20.04

## Requirements and prerequisites
- GIT installed in your system
- GIT LFS installed in your system
- SteamCMD installed in your system
- Broadband internet connection
- Router with the ability to port forward
- Min. 2 GB RAM

## Installing GIT Large file system

.pak files are large and we need to install Git Lfs in order to download them

Run the following commands:
- `apt update`
- `apt install git-lfs`

## Installing Steam SDK
The Steam server browser needs steamsdk and for this we need to install SteamCMD
- `cd ~/` Makes sure we are in the home directory
- `mkdir steamcmd` Makes SteamCMD directory
- `cd steamcmd` Goes to the SteamCMD directory
- `apt install lib32stdc++6` Install lib32std
- `wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz` Downloads SteamCMD Tar File.
- `tar -xvzf steamcmd_linux.tar.gz` Extracts SteamCMD
- `./steamcmd.sh` Runs the Steam CMD Shell

Steam CMD will install updates automatically but we need to login to install 64bit sdk. 

Wait for the `Steam>` to appear and then you type following commands:
- `login anonymous`
- `app_update 1007`
- `quit`

### Moving SDK to right place

We still need to move the sdk to default location where the server tries to 
- `cd ~/.steam` Go to the steam folder
- `mkdir sdk64` Create folder for the sdk
- `mv ~/steamcmd/linux64/steamclient.so ~/.steam/sdk64/` Move the steamclient.so from SteamCmd to .steam/sdk64 folder


 ## Installing the server.

After this we want to make sure we are in home directory
- `cd ~/`

Then we can clone the Linux repository
- `git clone https://github.com/Uuvana-Studios/longvinter-linux-server.git`

Then we want to give permission for this folder to execute commands with
- `sudo chmod -R ugo+rwx longvinter-linux-server/`

After this we can open the required ports by executing the shell script inside the repository
-`bash longvinter-linux-server/network-ports.sh`

## Customize the server

Server values can be customized with Game.ini

Create the file for edit with
`nano ~/longvinter-linux-server/Longvinter/Saved/Config/LinuxServer/Game.ini`

Add the following content there
```
[/Game/Blueprints/Server/GI_AdvancedSessions.GI_AdvancedSessions_C]
ServerName=Unnamed Island
MaxPlayers=32
ServerMOTD=Welcome to Longvinter Island!
Password=
CommunityWebsite=www.longvinter.com

[/Game/Blueprints/Server/GM_Longvinter.GM_Longvinter_C]
AdminSteamID=76561198965966997
```
- **ServerName:** Name that shows up in the server browser. Please don't call your server with OFFICIAL name. We want players to clearly know if they are joining a server that is hosted by other players.
- **ServerMOTD:** Server message that is on a signs around the island.
- **MaxPlayer:** Maximum allowed players that can connect at any given time.
- **CommunityWebsite:** Allows you to promote a website on a same place where the server message is shown. This link can be opened in-game.
- **Password:** Add you password here. Use only number and letters. If left empty there is no password on the server.
- **AdminSteamID:** Here you can add all the admins that you want to have in the server. **If you want to add multiple** separate id's with single space.
  - AdminSteamID=76561198965966997 11859676569976596

## Run the server
Start the server with shell script
- `sh ~/longvinter-linux-server/LongvinterServer.sh`

If the console shows these lines at the bottom after startup your server has started corretly
```
[2022.02.22-12.51.34:514][ 13]LogOnline: Verbose: STEAM: FOnlineAsyncEventSteamServerConnectedGS ServerId: Server[0x1404CD1FF72E008]
[2022.02.22-12.51.34:782][ 21]LogOnline: Verbose: STEAM: FOnlineAsyncEventSteamServerPolicyResponseGS Secure: 1
[2022.02.22-12.51.34:849][ 23]LogOnline: Verbose: OSS: Async task 'FOnlineAsyncTaskSteamCreateServer bWasSuccessful: 1' succeeded in 2.828243 seconds
[2022.02.22-12.51.34:849][ 23]LogOnlineSession: Warning: STEAM: Server setting ,TOTPLAYING_s:0 overflows Steam SetGameTags call
[2022.02.22-12.51.34:849][ 23]LogOnlineSession: Warning: STEAM: Server setting ,ServerName_s:[EU] Uuvana 1 overflows Steam SetGameTags call
```

I have created an automated script that you can run to automatically update and restart a server. <br>Make sure you have nohup installed on your system.
- `bash ~/longvinter-linux-server/server-autorun.sh`
