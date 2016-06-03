FROM node:6.2.0
# Author
MAINTAINER wizzer<wizzer@qq.com>
# Install imagemagick
ENV MAGICK_URL "http://imagemagick.org/download/releases"
ENV MAGICK_VERSION 7.0.1-7
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys 8277377A \
  && apt-get update -y \
  && apt-get install -y --no-install-recommends \
    libpng-dev libjpeg-dev libtiff-dev libopenjpeg-dev \
  && apt-get remove -y imagemagick \
  && cd /tmp \
  && curl -SLO "${MAGICK_URL}/ImageMagick-${MAGICK_VERSION}.tar.xz" \
  && curl -SLO "${MAGICK_URL}/ImageMagick-${MAGICK_VERSION}.tar.xz.asc" \
  && gpg --verify "ImageMagick-${MAGICK_VERSION}.tar.xz.asc" "ImageMagick-${MAGICK_VERSION}.tar.xz" \
  && tar xf "ImageMagick-${MAGICK_VERSION}.tar.xz" \

# http://www.imagemagick.org/script/advanced-unix-installation.php#configure
  && cd "ImageMagick-${MAGICK_VERSION}" \
  && ./configure \
    --disable-static \
    --enable-shared \

    --with-jpeg \
    --with-jp2 \
    --with-openjp2 \
    --with-png \
    --with-tiff \
    --with-quantum-depth=8 \

    --without-magick-plus-plus \
    # disable BZLIB support
    --without-bzlib \
    # disable ZLIB support
    --without-zlib \
    # disable Display Postscript support
    --without-dps \
    # disable FFTW support
    --without-fftw \
    # disable FlashPIX support
    --without-fpx \
    # disable DjVu support
    --without-djvu \
    # disable fontconfig support
    --without-fontconfig \
    # disable Freetype support
    --without-freetype \
    # disable JBIG support
    --without-jbig \
    # disable lcms (v1.1X) support
    --without-lcms \
    # disable lcms (v2.X) support
    --without-lcms2 \
    # disable Liquid Rescale support
    --without-lqr \
     # disable LZMA support
    --without-lzma \
    # disable OpenEXR support
    --without-openexr \
    # disable PANGO support
    --without-pango \
    # disable TIFF support
    --without-webp \
    # don't use the X Window System
    --without-x \
    # disable XML support
    --without-xml \

  && make \
  && make install \
  && ldconfig /usr/local/lib \

  && apt-get -y autoclean \
  && apt-get -y autoremove \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create app directory
RUN mkdir -p /node/sunshop
WORKDIR /node/sunshop

# Install app dependencies
COPY package.json /node/sunshop
RUN npm config set registry https://registry.npm.taobao.org
RUN npm i node-gyp -g 
RUN npm i pm2 -g 

RUN cd /node/sunshop
# Bundle app source
COPY . /node/sunshop
RUN npm i
CMD [ "pm2", "start", "--no-daemon", "app.js" ]