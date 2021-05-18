FROM ubuntu:20.04

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y -q \
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
 python3-pip \
 woff2 \
 xz-utils && apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1 && python --version

RUN curl -SL https://github.com/fontforge/fontforge/releases/download/20201107/fontforge-20201107.tar.xz | tar -xJC /tmp

RUN cd /tmp/fontforge-20201107 && mkdir build && cd build && \
 cmake -DENABLE_GUI=OFF -DCMAKE_INSTALL_PREFIX=/usr -GNinja .. && \
 ninja && ninja install && ldconfig && cd /tmp && rm -R fontforge-20201107

RUN cd /tmp && git clone --recursive https://github.com/nyon/fontawesome-actions.git && mv fontawesome-actions /fa-actions

RUN curl -SL https://github.com/wget/ttf2eot/archive/v0.0.3.tar.gz | tar -xzC /tmp

RUN cd /tmp/ttf2eot-0.0.3 && make && cp ttf2eot /usr/local/bin

RUN pip3 install fonttools[ufo,lxml,woff,unicode]

WORKDIR /fa-actions
ENTRYPOINT ["/usr/bin/python"]
CMD ["/fa-actions/main.py"]
