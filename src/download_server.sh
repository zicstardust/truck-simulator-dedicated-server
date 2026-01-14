#!/usr/bin/env bash

set -e
: "${GAME:=euro2}"
: "${VERSION:=latest}"
: "${APP_CACHE:=true}"
: "${DISABLE_CACHE:=false}"


if [ "$GAME" == "euro2" ]; then
    GAME_ID="1948160"
    GAME_NAME="Euro Truck Simulator 2"
elif [ "$GAME" == "american" ]; then
    GAME_ID="2239530"
    GAME_NAME="American Truck Simulator"
else
    echo "Game: ${GAME} not valid"
    exit 1
fi

if [ "$VERSION" == "latest" ]; then
    VERSION="1.57"
fi


if [ "$VERSION" == "beta" ]; then
    BRANCHE="public_beta"
    APP_CACHE="false"
elif [ "$VERSION" == "1.57" ]; then
    BRANCHE="public"
elif [ "$VERSION" == "1.56" ]; then
    BRANCHE="temporary_1_56"
elif [ "$VERSION" == "1.55" ]; then
    BRANCHE="temporary_1_55"
elif [ "$VERSION" == "1.54" ]; then
    BRANCHE="temporary_1_54"
elif [ "$VERSION" == "1.53" ]; then
    BRANCHE="temporary_1_53"
elif [ "$VERSION" == "1.52" ]; then
    BRANCHE="temporary_1_52"
elif [ "$VERSION" == "1.51" ]; then
    BRANCHE="temporary_1_51"
elif [ "$VERSION" == "1.50" ]; then
    BRANCHE="temporary_1_50"
elif [ "$VERSION" == "1.49" ]; then
    BRANCHE="temporary_1_49"
elif [ "$VERSION" == "1.48.5" ]; then
    BRANCHE="temporary_1_48_5"
elif [ "$VERSION" == "1.48" ]; then
    BRANCHE="temporary_1_48"
elif [ "$VERSION" == "1.47" ]; then
    BRANCHE="temporary_1_47"
elif [ "$VERSION" == "1.46" ] && [ "$GAME" == "american" ]; then
    BRANCHE="temporary_1_46"
else
    echo "VERSION ${VERSION} not supported"
    exit 1
fi

echo "Downloading ${GAME_NAME} server VERSION ${VERSION}..."

if [[ "$DISABLE_CACHE" =~ ^(0|false|False|n|N)$ ]]; then
    cache.sh restore_steamcmd
    cache.sh restore_app $VERSION $GAME_NAME $GAME
fi

steamcmd.sh +force_install_dir /app +login anonymous +app_update ${GAME_ID} validate -beta ${BRANCHE} +quit

if [[ "$DISABLE_CACHE" =~ ^(0|false|False|n|N)$ ]]; then
    cache.sh backup_steamcmd
    cache.sh backup_app $VERSION $GAME $GAME_NAME $APP_CACHE
fi
