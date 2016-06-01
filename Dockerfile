FROM node:6
# Author
MAINTAINER wizzer
# Install wget
RUN yum install -y wget
# Install imagemagick
ENV MAGICK_URL "http://imagemagick.org/download/releases"
ENV MAGICK_VERSION 7.0.1-7
RUN mkdir -p /node
RUN cd /node
RUN wget "${MAGICK_URL}/ImageMagick-${MAGICK_VERSION}.tar.gz"
RUN tar xzvf "ImageMagick-${MAGICK_VERSION}.tar.gz"
RUN cd "ImageMagick-${MAGICK_VERSION}"
RUN ./configure --disable-static --enable-shared --with-jpeg --with-jp2 --with-openjp2 --with-png --with-tiff --with-quantum-depth=8 
RUN make
RUN make install

# Create app directory
RUN mkdir -p /node/sunshop
WORKDIR /node/sunshop

# Install app dependencies
COPY package.json /node/sunshop
RUN npm config set registry https://registry.npm.taobao.org
RUN npm install

# Bundle app source
COPY . /node/sunshop
RUN cd /node/sunshop
EXPOSE 8080
CMD [ "node", "app.js" ]