FROM ubuntu:20.04
RUN apt update \
&& apt remove modemmanager -y \
&& apt install sudo \
&& apt install gstreamer1.0-plugins-bad gstreamer1.0-libav gstreamer1.0-gl -y \
&& apt install libqt5gui5 -y \
&& apt install libqt5gui5 -y \
&& useradd -m -G sudo dialout -s /bin/bash qgc \
&& apt install wget fuse -y \
&& cd && wget https://d176tv9ibo4jno.cloudfront.net/latest/QGroundControl.AppImage \
&& ./QGroundControl.AppImage
ENV DISPLAY
ENV QT_X11_NO_MITSHM="1"
ENV LIBGL_ALWAYS_SOFTWARE="1"