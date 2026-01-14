#!/usr/bin/env bash

#download server
download_server.sh

#server run
export LD_LIBRARY_PATH="/app/linux64${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"


cd /app

if [ -f "/app/bin/linux_x64/eurotrucks2_server" ]; then
    ln -s /data "/home/trucksimulator/.local/share/Euro Truck Simulator 2"
    /app/bin/linux_x64/eurotrucks2_server
elif [ -f "/app/bin/linux_x64/amtrucks_server" ]; then
    ln -s /data "/home/trucksimulator/.local/share/American Truck Simulator"
    /app/bin/linux_x64/amtrucks_server
fi