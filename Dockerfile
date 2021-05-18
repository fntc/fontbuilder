FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
 libjpeg-dev \
 libtiff5-dev \
 libpng-dev \
 libfreetype6-dev \
 libgif-dev \
 libgtk-3-dev \
 libxml2-dev \
 libpango1.0-dev \
 libcairo2-dev \
 libspiro-dev \
 libuninameslist-dev \
 python3-dev \
 ninja-build \
 cmake \
 build-essential \
 gettext \
 git \
 python \
 python-dev \
 python-pip\
 python3-pip \
 woff2 \
 xz-utils && apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var$

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1 && $

RUN curl -SL https://github.com/fontforge/fontforge/releases/download/20201107/$

RUN cd /tmp/fontforge-20201107 && mkdir build && cd build && cmake -DENABLE_GUI$

RUN cd /tmp && git clone --branch v0.17.0 --recursive https://github.com/nyon/f$

RUN curl -SL https://github.com/wget/ttf2eot/archive/v0.0.3.tar.gz | tar -xzC /$

RUN cd /tmp/ttf2eot-0.0.3 && make && cp ttf2eot /usr/local/bin

RUN pip3 install fonttools[ufo,lxml,woff,unicode]

WORKDIR /fa-actions
ENTRYPOINT ["/usr/bin/python"]
CMD ["/fa-actions/main.py"]
