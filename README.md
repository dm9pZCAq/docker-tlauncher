# build:
`docker build -t tlauncher github.com/kzwg63tf/docker-tlauncher`

# preparation:
`xhost +local:docker` allow docker to open window

# running:
```
docker run --rm -dit \
    --device /dev/snd \
    -e DISPLAY=$DISPLAY \
    -v $HOME/.minecraft/:/minecraft \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    tlauncher
 ```
* __--device /dev/snd__ - mount sound devices
* __$HOME/.minecraft/__ - directory to store minecraft data
* __/tmp/.X11-unix__ - path to x11 control directory
