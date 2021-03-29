#!/bin/bash

docker build -t tizen-studio-docker .

if [ ! -d $HOME/tizen-studio-home ]; then
    mkdir $HOME/tizen-studio-home
fi

docker run --rm -it --privileged --device=/dev/dri:/dev/dri --net=host --env="DISPLAY" --volume="$XAUTHORITY:/root/.Xauthority:ro" --volume="$HOME/tizen-studio-home:/home/tizen/:rw" --name=tizen --entrypoint="/opt/script/prepare-env.sh" tizen-studio-docker
