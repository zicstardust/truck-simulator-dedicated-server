#!/usr/bin/env bash

set -e
: "${GAME:=euro2}"
: "${BUILD:=latest}"
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

if [ "$BUILD" == "latest" ]; then
    BUILD="1.57"
fi


if [ "$BUILD" == "beta" ]; then
    BRANCHE="public_beta"
    APP_CACHE="false"
elif [ "$BUILD" == "1.57" ]; then
    BRANCHE="public"
elif [ "$BUILD" == "1.56" ]; then
    BRANCHE="temporary_1_56"
elif [ "$BUILD" == "1.55" ]; then
    BRANCHE="temporary_1_55"
elif [ "$BUILD" == "1.54" ]; then
    BRANCHE="temporary_1_54"
elif [ "$BUILD" == "1.53" ]; then
    BRANCHE="temporary_1_53"
elif [ "$BUILD" == "1.52" ]; then
    BRANCHE="temporary_1_52"
elif [ "$BUILD" == "1.51" ]; then
    BRANCHE="temporary_1_51"
elif [ "$BUILD" == "1.50" ]; then
    BRANCHE="temporary_1_50"
elif [ "$BUILD" == "1.49" ]; then
    BRANCHE="temporary_1_49"
elif [ "$BUILD" == "1.48.5" ]; then
    BRANCHE="temporary_1_48_5"
elif [ "$BUILD" == "1.48" ]; then
    BRANCHE="temporary_1_48"
elif [ "$BUILD" == "1.47" ]; then
    BRANCHE="temporary_1_47"
elif [ "$BUILD" == "1.46" ] && [ "$GAME" == "american" ]; then
    BRANCHE="temporary_1_46"
else
    echo "BUILD ${BUILD} not supported"
    exit 1
fi

echo "Downloading ${GAME_NAME} server BUILD ${BUILD}..."

if [[ "$DISABLE_CACHE" =~ ^(0|false|False|n|N)$ ]]; then
    cache.sh restore_steamcmd
    cache.sh restore_app $BUILD
fi

steamcmd.sh +force_install_dir /app +login anonymous +app_update ${GAME_ID} validate -beta ${BRANCHE} +quit

if [[ "$DISABLE_CACHE" =~ ^(0|false|False|n|N)$ ]]; then
    cache.sh backup_steamcmd
    cache.sh backup_app $BUILD $APP_CACHE
fi
