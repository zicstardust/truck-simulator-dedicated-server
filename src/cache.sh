#!/usr/bin/env bash

option=$1
VERSION=$2
GAME=$3
GAME_NAME=$4
APP_CACHE=$5


cache_dir="/cache"


backup_steamcmd(){
    echo "Caching steamcmd..."
    if [ -e "${cache_dir}/steamcmd.tar.gz" ]; then
        rm -f "${cache_dir}/steamcmd.tar.gz"
    fi

    if [ -e "${cache_dir}/steamcmd_config.tar.gz" ]; then
        rm -f "${cache_dir}/steamcmd_config.tar.gz"
    fi

    tar -C /opt/steamcmd -czf ${cache_dir}/steamcmd.tar.gz .
    tar -C /home/trucksimulator -czf ${cache_dir}/steamcmd_config.tar.gz ./Steam
    chmod 440 ${cache_dir}/steamcmd.tar.gz ${cache_dir}/steamcmd_config.tar.gz
}


restore_steamcmd(){
    if [ -e "${cache_dir}/steamcmd.tar.gz" ]; then
        echo "Restore cache steamcmd..."
        tar -xzf ${cache_dir}/steamcmd.tar.gz  -C /opt/steamcmd/
        tar -xzf ${cache_dir}/steamcmd_config.tar.gz  -C /home/trucksimulator/
    fi
}


backup_app(){
    if [[ "$APP_CACHE" =~ ^(1|true|True|y|Y)$ ]]; then
        echo "Caching ${GAME_NAME} server version ${VERSION}..."
        if [ -e "${cache_dir}/app_${GAME}_${VERSION}.tar.gz" ]; then
            rm -f "${cache_dir}/app_${GAME}_${VERSION}.tar.gz"
        fi

        tar -C /app -czf ${cache_dir}/app_${GAME}_${VERSION}.tar.gz .
        chmod 440 ${cache_dir}/app_${GAME}_${VERSION}.tar.gz
    fi
}


restore_app(){
    if [ -e "${cache_dir}/app_${GAME}_${VERSION}.tar.gz" ]; then
        echo "Restore cache ${GAME_NAME} server version ${VERSION}..."
        tar -xzf ${cache_dir}/app_${GAME}_${VERSION}.tar.gz -C /app/
    fi
}



case $option in

  backup_steamcmd)
    backup_steamcmd
    ;;

  restore_steamcmd)
    restore_steamcmd
    ;;

  backup_app)
    backup_app
    ;;

  restore_app)
    restore_app
    ;;

  *)
    echo "cache.sh: argument invalid"
    exit 1
    ;;
esac
