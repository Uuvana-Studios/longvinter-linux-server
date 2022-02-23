#!/bin/bash
echo checking for updates

UpdateServer () {
	killall LongvinterServer.sh
        echo "Server closed, now getting latest version"
        sudo git restore .
        sleep 1
        sudo git pull "https://github.com/Uuvana-Studios/longvinter-linux-server.git" main
        sleep 1
        echo "Starting server.."
        sudo chmod -R ugo+rwx /home/nilsson/longvinter-linux-server/
        nohup bash ~/longvinter-linux-server/LongvinterServer.sh > ~/server-logs/longvinter.log &
}

cd ~/longvinter-linux-server

git fetch

if git merge-base --is-ancestor origin/main main ; then
        echo "Nothing to update"
else
        echo "Change found, updating server.."
        UpdateServer
fi
