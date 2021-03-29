#!/bin/bash

docker run --rm -d --privileged --device=/dev/dri:/dev/dri --net=host --env="DISPLAY" --volume="$XAUTHORITY:/root/.Xauthority:ro" --volume="$HOME/tizen-studio-home:/home/tizen/:rw" --name=tizen --entrypoint="/home/tizen/tizen-studio/package-manager/package-manager.bin" tizen-studio-docker
