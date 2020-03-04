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
 git \
 python \
 python-dev 
 
# python3 \
# python3-dev
#RUN ln -s /usr/bin/python3 /usr/bin/python

RUN curl -SL https://github.com/fontforge/fontforge/releases/download/20190801/fontforge-20190801.tar.gz | tar -xzC /tmp

RUN cd /tmp/fontforge-20190801 && ./bootstrap && ./configure --enable-python-scripting --enable-python-extension && make && make install && ldconfig && cd .. && rm -R fontforge-20190801

RUN cd /tmp && git clone --branch v0.17.0 --recursive https://github.com/nyon/fontawesome-actions.git && mv fontawesome-actions /fa-actions

RUN curl -SL https://github.com/wget/ttf2eot/archive/v0.0.3.tar.gz | tar -xzC /tmp

RUN cd /tmp/ttf2eot-0.0.3 && make && cp ttf2eot /usr/local/bin

WORKDIR /fa-actions
ENTRYPOINT ["/usr/bin/python"]
CMD ["/fa-actions/main.py"]
