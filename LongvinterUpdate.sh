#!/bin/bash
echo checking for updates

UpdateServer () {
	killall LongvinterServer.sh
        echo "Server closed, now getting latest version"
        git restore .
        sleep 1
        git pull "https://github.com/Uuvana-Studios/longvinter-linux-server.git" official
        sleep 1
        echo "Starting server.."
        sudo chmod -R ugo+rwx ~/longvinter-linux-server/
        bash ~/longvinter-linux-server/LongvinterServer.sh
}

cd ~/longvinter-linux-server

git fetch

if git merge-base --is-ancestor origin/official official ; then
        echo "Nothing to update"
else
        echo "Change found, updating server.."
        UpdateServer
fi