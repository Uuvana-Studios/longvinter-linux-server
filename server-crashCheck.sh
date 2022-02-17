#!/bin/bash

echo checking server status


pidof  sh /home/nilsson/longvinter-linux-server/LongvinterServer.sh
if [[ $? -ne 0 ]] ; then
	nohup sh ~/longvinter-linux-server/LongvinterServer.sh > ~/server-logs/longvinter.log &
        echo "Restarting script"
fi
