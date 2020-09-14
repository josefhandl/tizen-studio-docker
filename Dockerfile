FROM ubuntu:16.04

RUN apt update && apt upgrade -y
RUN apt install -y --no-install-recommends wget openjdk-8-jdk libwebkitgtk-1.0-0 cpio rpm2cpio pciutils zip acl bridge-utils openvpn libfontconfig1 libglib2.0-0 libjpeg-turbo8 libpixman-1-0 libpng12-0 libsdl1.2debian libsm6 libv4l-0 libx11-xcb1 libxcb-icccm4 libxcb-image0 libxcb-randr0 libxcb-render-util0 libxcb-shape0 libxcb-xfixes0 libxi6 libcurl3-gnutls python2.7 gettext make qemu-kvm libvirt-bin virtinst bridge-utils cpu-checker gcc libc6-dev rsync sudo \
  mesa-utils

RUN rm -rf /var/lib/apt/lists/*

RUN useradd --user-group --create-home --home-dir /home/tizen --shell /bin/bash tizen
RUN echo "root:root" | chpasswd
RUN echo "tizen:tizen" | chpasswd

RUN rsync -a /home/tizen/ /opt/

RUN wget -O /opt/tizen.bin http://download.tizen.org/sdk/Installer/tizen-studio_3.7/web-cli_Tizen_Studio_3.7_ubuntu-64.bin
#ADD tizen.bin /opt/
ADD script /opt/script
#ADD docker-entrypoint.sh /

RUN chown tizen:tizen /home/tizen
RUN chown tizen:tizen /opt/tizen.bin && chmod +x /opt/tizen.bin

RUN chown tizen:tizen /opt/script/prepare-env.sh && chown tizen:tizen /opt/script/run-tizen.sh
RUN chmod +x /opt/script/prepare-env.sh && chmod +x /opt/script/run-tizen.sh && chmod +x /opt/script/enable-kvm.sh
RUN gcc -o /opt/script/enable-kvm /opt/script/enable-kvm.c && chmod +s /opt/script/enable-kvm

RUN usermod -aG sudo tizen

USER tizen

#RUN /tizen.bin --accept-license /home/tizen/tizen-studio

#USER root

#ENTRYPOINT ["./docker-entrypoint.sh"]
ENTRYPOINT ["glxgears", "-info"]
