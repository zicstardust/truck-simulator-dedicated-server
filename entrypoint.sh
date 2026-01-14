#!/usr/bin/env bash

set -e

: "${PUID:=1000}"
: "${PGID:=1000}"

if ! getent group trucksimulator >/dev/null; then
    groupadd -g "$PGID" trucksimulator
fi

if ! id -u trucksimulator >/dev/null 2>&1; then
    useradd -m -u "$PUID" -g "$PGID" -s /sbin/nologin trucksimulator
fi

mkdir -p /data /home/trucksimulator /cache

chown -R trucksimulator:trucksimulator /app /data /home/trucksimulator /opt/steamcmd /cache

exec gosu trucksimulator "$@"
