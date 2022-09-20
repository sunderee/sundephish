#!/usr/bin/env bash
# --- CLEANUP --- #
docker stop "$(docker ps --all --quiet)"
docker rm "$(docker ps --all --quiet)"
docker system prune --all --force

# --- BUILD & RUN --- #
docker build \
    --tag=sundephish \
    --file=Dockerfile .
docker run \
    --name=sundephish \
    --publish=3000:3000 \
    --detach sundephish 
