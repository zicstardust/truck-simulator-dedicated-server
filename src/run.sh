#!/usr/bin/env bash

#download server
download_server.sh

#server run
export LD_LIBRARY_PATH="/app/linux64${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"

cd /app/bin/linux_x64
/app/bin/linux_x64/eurotrucks2_server \
    -homedir /data
