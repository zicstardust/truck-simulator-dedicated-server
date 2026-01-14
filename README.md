# Project Zomboid Dedicated Server 
Project Zomboid dedicated server container with auto download of workshop mods for non-steam servers

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
      - 16261:16261/udp #Default_Port
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
| `BUILD` | Set build server version | latest | [Look at the set build section](#set-build) |
| `DISABLE_CACHE` | Disable download cache | false | |

## Set GAME
| Value | Game version |
| :----: | --- |
| `euro2` | Euro Truck Simulator 2 |
| `american` | American Truck Simulator |

## Set BUILD

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
