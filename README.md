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

Run the following commands according to your chosen system:

**Ubuntu/Debian**
- `$ apt update`
- `$ apt install git git-lfs`

**Arch-Linux**
- `$ pacman -Sy`
- `$ pacman -S git git-lfs`

**Fedora**
- `$ yum update`
- `$ yum install git git-lfs`

## Creating a dedicated user

- `$ useradd -m -d /home/steam steamcmd`
- `$ passwd steamcmd` (Choose a stronge secure password)
- `$ usermod -aG sudo steamcmd`
- `$ su steamcmd`

## Installing Steam SDK
The Steam server browser needs steamsdk and for this we need to install SteamCMD, we will do this under the steamcmd user.
- `cd ~/` Makes sure we are in the home directory
- `mkdir steamcmd` Makes SteamCMD directory
- `cd steamcmd` Goes to the SteamCMD directory
- `apt install lib32stdc++6` Install lib32std
- `wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz` Downloads SteamCMD Tar File.
- `tar -xvzf steamcmd_linux.tar.gz` Extracts SteamCMD
- `./steamcmd.sh +force_install_dir . +login anonymous +app_update 1007 +quit'` Runs SteamCMD to login, install a app update and quit upon completion.
- `./steamcmd.sh +force_install_dir . +login anonymous +app_update 1007 +quit` Runs SteamCMD to login, install a app update and quit upon completion.

Steam CMD will install updates automatically and login to install 64-bit SDK.

### Copying SDK to right place

We still need to move the sdk to default location where the server tries to 
- `cd ~/.steam` Go to the steam folder
- `mkdir sdk64` Create folder for the sdk
- `cp ~/steamcmd/linux64/steamclient.so ~/.steam/sdk64/` Copy the steamclient.so from SteamCmd to .steam/sdk64 folder

 ## Installing the server.

After this we want to make sure we are in home directory
- `cd ~/`

Then we can clone the Linux repository
- `git clone https://github.com/Uuvana-Studios/longvinter-linux-server.git`

Then we want to give permission for this folder to execute commands with
- `sudo chmod -R ugo+rwx longvinter-linux-server/`

After this we can open the required ports by executing the following commands:
- `sudo iptables -I INPUT -p udp --dport 7777 -j ACCEPT`
- `sudo iptables -I INPUT -p tcp --dport 7777 --syn -j ACCEPT`
- `sudo iptables -I INPUT -p udp --dport 27016 -j ACCEPT`
- `sudo iptables -I INPUT -p tcp --dport 27016 --syn -j ACCEPT`
- `sudo iptables -I INPUT -p udp --dport 27015 -j ACCEPT`
- `sudo iptables -I INPUT -p tcp --dport 27015 --syn -j ACCEPT`

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

### Start the server manually with shell script
- `sh /home/steam/longvinter-linux-server/LongvinterServer.sh`

### Start the server automatically with Systemd (Recommended)
- `$ cp /home/steam/longvinter-linux-server/longvinter.service /etc/systemd/system/longvinter.service`
- `$ systemctl daemon-reload`

Now, how to use it:
- `$ systemctl start longvinter.service` (Starts the server)
- `$ systemctl stop longvinter.service` (Stops the server)
- `$ systemctl restart longvinter.service` (Restart the server, for example, if you made a change to Game.ini)
- `$ systemctl enable longvinter.service` (Everytime you reboot the machine it starts on boot)
- `$ systemctl status longvinter.service` (Checks the latest 20 lines on the server console)


If the console shows these lines at the bottom after startup your server has started corretly
```
[2022.02.22-12.51.34:514][ 13]LogOnline: Verbose: STEAM: FOnlineAsyncEventSteamServerConnectedGS ServerId: Server[0x***************]
[2022.02.22-12.51.34:782][ 21]LogOnline: Verbose: STEAM: FOnlineAsyncEventSteamServerPolicyResponseGS Secure: 1
[2022.02.22-12.51.34:849][ 23]LogOnline: Verbose: OSS: Async task 'FOnlineAsyncTaskSteamCreateServer bWasSuccessful: 1' succeeded in 2.828243 seconds
[2022.02.22-12.51.34:849][ 23]LogOnlineSession: Warning: STEAM: Server setting ,TOTPLAYING_s:0 overflows Steam SetGameTags call
[2022.02.22-12.51.34:849][ 23]LogOnlineSession: Warning: STEAM: Server setting ,ServerName_s:[EU] Uuvana 1 overflows Steam SetGameTags call
```

## Updating the server
We have created an automated script that you can run to automatically update and restart a server.
- `bash /home/steam/longvinter-linux-server/LongvinterUpdate.sh`

## Backing up your saves
We have created an automated script that you can run to automatically backup and restart a server, for now it has to be run manually and it requires user input.
- `bash /home/steam/longvinter-linux-server/LongvinterBackup.sh`
