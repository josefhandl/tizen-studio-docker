# Dockerized Tizen Studio

Fully functional Tizen Studio on any Linux distro using Docker.

This project creates a Docker image with Tizen Studio based on Ubuntu 16.04 with X11 forwarding to your local X server (host desktop system). You can use virtual Tizen device, HW GPU acceleration and VT-x (Intel CPU virtualization technology) are supported for virtual devices.

## Usage 

1. Clone this project
2. Run `./build.sh` to build the image
3. Run `./install.sh`
The script will create a "**tizen-studio-home**" directory in your home path
4. Run `./package-manager.sh` to install required packages
5. Run `./run.sh` to run Tizen Studio

Please do not run the Package Manager using Tizen Studio! Use only `./package-manager.sh` script and only if the studio is closed (no container from this project is running). The Manager process is Studio's descendant and the Studio need to be closed while installing packages. If you close the Studio, the docker container would be closed.

## HW CPU acceleration (VT-x)

To use a virtual device, create a new one. Open setting for this new device in the "**HW support**" section and make sure both options (**CPU VT**, **GPU**) are activated.

To have **VT-x** working in the container you have to make sure the **VT-x** is enabled in the BIOS.

[//]: <> (
Background
This project uses abilities as:
Running GUI application in docker container and "**drawing**" it to your local machine's X server.
Docker with HW GPU acceleration
Docker with VT-x support
HW GPU acceleration)
[//]: <> (You have to run the container with '**--privileged --device=/dev/dri:/dev/dri**' params to make your GPUs available inside the container.
Add '**--net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw"** ' to expose the **DISPLAY** var and autorize to your host system's X server.)
[//]: <> (HW CPU acceleration VT-x
TODO and the container has installed KVM. pridat odkaz na zprovozneni VT-x na hostovi
)
