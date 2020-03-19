#!/bin/sh

cookie=$(xauth list | tail -n 1 | awk '{print $3}')

docker run -i -t --name modelsim --net=host -e DISPLAY -v /tmp/.X11-unix \
        -v $(pwd):/host --rm goldensniper/modelsim-docker \
        bash -c "xauth add $(hostname)/unix$DISPLAY MIT-MAGIC-COOKIE-1 $cookie; vsim"
