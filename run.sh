#!/bin/bash

docker run --rm -d --privileged --device=/dev/dri:/dev/dri --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" --volume="$HOME/tizen-studio-home:/home/tizen/:rw" --name=tizen --entrypoint="/opt/script/run-tizen.sh" tizen-studio-docker
