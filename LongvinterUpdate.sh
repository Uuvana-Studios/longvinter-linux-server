#!/bin/bash
echo checking for updates

UpdateServer () {
        systemctl is-active --quiet longvinter && echo "Server is running!"
        sudo systemctl stop longvinter && echo "Server is now closed, now getting latest version..."
        git restore .
        sleep 1
        git pull "https://github.com/Uuvana-Studios/longvinter-linux-server.git" official
        sleep 1
        echo "Starting server..."
        sudo chmod -R ugo+rwx /home/nilsson/longvinter-linux-server/
        sudo systemctl start longvinter && echo "Server is now running!"
}

cd /home/nilsson/longvinter-linux-server

git fetch

if git merge-base --is-ancestor origin/official official ; then
        echo "Nothing to update"
else
        echo "Change found, updating server.."
        UpdateServer
fi
