#for wiping progress and keeping bans
sudo systemctl stop longvinter && echo "Server is now closed, copying banned steam ids to backup"

sudo cp /home/nilsson/longvinter-linux-server/Longvinter/Saved/SaveGames/BannedSteamID.sav /home/nilsson/longvinter-linux-server/Longvinter/Saved

sudo rm -rf /home/nilsson/longvinter-linux-server/Longvinter/Saved/SaveGames
sudo systemctl start longvinter && echo "Server now started!"
sleep 5
sudo systemctl stop longvinter && echo "Server is now closed, copying banned steam ids to directory"
sudo cp /home/nilsson/longvinter-linux-server/Longvinter/Saved/BannedSteamID.sav /home/nilsson/longvinter-linux-server/Longvinter/Saved/SaveGames/
sudo systemctl start longvinter && echo "Server now started!"