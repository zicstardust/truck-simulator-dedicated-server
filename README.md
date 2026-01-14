# Truck Simulador Dedicated Server 
Euro Truck Simulador 2 and American Truck Simulador dedicated server container.

[GitHub](https://github.com/zicstardust/truck-simulator-dedicated-server)

## Container
### Tags

| Tag | Architecture | Description |
| :----: | :----: | :----: |
| [`latest`](https://github.com/zicstardust/truck-simulator-dedicated-server/blob/main/dockerfile) | amd64 | Dedicated Server |

### Registries
| Registry | Full image name | Description |
| :----: | :----: | :----: |
| [`docker.io`](https://hub.docker.com/r/zicstardust/truck-simulator-dedicated-server) | `docker.io/zicstardust/truck-simulator-dedicated-server` | Docker Hub |
| [`ghcr.io`](https://github.com/zicstardust/truck-simulator-dedicated-server/pkgs/container/truck-simulator-dedicated-server) | `ghcr.io/zicstardust/truck-simulator-dedicated-server` | GitHub |

## Usage
### Compose
``` yml
services:
  pzserver:
    container_name: truck-simulator-dedicated-server
    image: docker.io/zicstardust/truck-simulator-dedicated-server:latest
    environment:
      TZ: America/New_York
    ports:
      - 27015:27015/tcp #Connection Dedicated Port
      - 27015:27015/udp #Connection Dedicated Port
      - 27016:27016/tcp #Query Dedicated Port
      - 27016:27016/udp #Query Dedicated Port
    volumes:
      - <path to data>:/data
      - <path to cache>:/cache #Opcional: Download cache
```

## Environment variables

| variables | Function | Default | Exemple/Info
| :----: | --- | :----: | --- |
| `TZ` | Set Timezone | | |
| `PUID` | Set UID | 1000 | |
| `PGID` | Set GID | 1000 | |
| `GAME` | Set game server | euro2 | [Look at the set game section](#set-game) |
| `VERSION` | Set server version | latest | [Look at the set version section](#set-version) |
| `DISABLE_CACHE` | Disable download cache | false | |

## Set GAME
| Value | Game version |
| :----: | --- |
| `euro2` | Euro Truck Simulator 2 |
| `american` | American Truck Simulator |

## Set VERSION

| Value | Description | Server version |
| :----: | --- | --- |
| `beta` | Last beta version | 1.57  |
| `1.57`, `latest` | Last stable version | 1.57 |
| `1.56` | Server 1.56 | 1.56.x |
| `1.55` | Server 1.55 | 1.55.x |
| `1.54` | Server 1.54 | 1.54.x |
| `1.53` | Server 1.53 | 1.53.x |
| `1.52` | Server 1.52 | 1.52.x |
| `1.51` | Server 1.51 | 1.51.x |
| `1.50` | Server 1.50 | 1.50.x |
| `1.49` | Server 1.49 | 1.49.x |
| `1.48.5` | Server 1.48.5 | 1.48.5 |
| `1.48` | Server 1.48 | 1.48.x |
| `1.47` | Server 1.47 | 1.47.x |
| `1.46` | Server 1.46, only American Truck Simulator | 1.46.x |


## Required files to run dedicated server

"server_packages.sii" - contains map details, dlc and mods configuration

"server_packages.dat" - contains internal map data

### How to export server_packages
- Install Euro 2/American Truck Simulador game.
- Run game once and close.
- Edit config.cfg [found in game home directory](https://modding.scssoft.com/wiki/Documentation/Engine/Game_user_path).
- Enable game console.
``` conf
uset g_developer "1"
uset g_minicon "1"
uset g_console_state "1"
uset g_console "1"
```
- Run game.
- Load save game
- When game is running press `~` or `'` to open game console.
- run `export_server_packages` 
- This will **generate server_packages.sii** and **server_packages.dat**. These files carry dlc and mod configuration based on your current game setup. 
- manually copy **server_packages.sii** and **server_packages.dat** to container volume `/data/`.

These files are NOT linked to your account in any way. 

[More infos](https://modding.scssoft.com/wiki/Documentation/Tools/Dedicated_Server#How_to_launch_a_dedicated_server_on_Linux_without_Steam_client_installed)

