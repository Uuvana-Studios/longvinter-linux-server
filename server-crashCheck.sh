#!/bin/bash

echo checking server status


pidof bash  ~/longvinter-linux-server/LongvinterServer.sh
echo $?
bash ~/longvinter-linux-server/LongvinterServer.sh
if [[ $? -le 0 ]] ; then
	
        echo "Restarting script"
fi
