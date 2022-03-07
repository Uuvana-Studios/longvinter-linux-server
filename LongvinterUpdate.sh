#!/bin/bash
echo "Checking for updates..."

UpdateServer () {
        systemctl is-active --quiet longvinter && echo "Server is running!"
        sudo systemctl stop longvinter && echo "Server is now closed, now getting latest version..."
        git restore .
        sleep 1
        git pull "https://github.com/Uuvana-Studios/longvinter-linux-server.git" main
        sleep 1
        echo "Starting server..."
        sudo chmod -R ugo+rwx /home/steam/longvinter-linux-server/
        sudo systemctl start longvinter && echo "Server is now running!"
}

cd /home/steam/longvinter-linux-server

git fetch

if git merge-base --is-ancestor origin/main main ; then
        echo "Nothing to update."
else
        echo "Change found, updating server..."
        UpdateServer
fi
