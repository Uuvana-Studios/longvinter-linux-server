#!/bin/sh
# Install Dependencies
apt update && apt upgrade -y && apt install git git-lfs lib32stdc++6 -y
# Install SteamCMD
mkdir steamcmd && cd steamcmd
wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
tar -xvzf steamcmd_linux.tar.gz
./steamcmd.sh +force_install_dir . +login anonymous +app_update 1007 +quit
# Moving SteamSDK
cd ~/.steamcmd
mkdir sdk64
mv ~/steamcmd/sdk64/* ~/.steamcmd/sdk64/
# Installing the actual Longvinter server. Since we copied everything in the Dockerfile, we can just run server as normal. However, this will run a git pull to check for the latest version.
cd ~/
git pull
~/longvinter-linux-server/network-ports.sh
# Starts the server.
~/longvinter-linux-server/server-autorun.sh