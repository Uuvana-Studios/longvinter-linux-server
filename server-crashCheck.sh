#!/bin/bash

echo checking server status


pidof  sh /home/nilsson/longvinter-linux-server/LongvinterServer.sh
if [[ $? -ne 0 ]] ; then
	bash ~/longvinter-linux-server/LongvinterServer.sh
        echo "Restarting script"
fi
