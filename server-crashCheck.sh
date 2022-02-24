#!/bin/bash

echo checking server status


pidof bash  ~/longvinter-linux-server/LongvinterServer.sh
echo $?
if [[ $? -le 2 ]] ; then
	bash ~/longvinter-linux-server/LongvinterServer.sh
        echo "Restarting script"
fi
