#!/usr/bin/env bash

cd /home/minecraft/server || exit 1

docker container stop minecraft
docker container rm minecraft
git pull
docker run -d -v \
  /home/minecraft/server:/data \
  -e TYPE=FABRIC \
  -e VERSION=1.18.2 \
  -e MEMORY=6G \
  -e EULA=TRUE \
  -p 25565:25565 \
  --name minecraft \
  -e "PACKWIZ_URL=https://discordgatchi.github.io/the-gatchi-pack/pack.toml" itzg/minecraft-server