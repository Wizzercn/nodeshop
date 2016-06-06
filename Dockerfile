FROM node:6.2.0
# Author
MAINTAINER wizzer<wizzer@qq.com>
# Install imagemagick
ENV MYSQL_HOST "192.168.1.11"
ENV MYSQL_USER "root"
ENV MYSQL_PASSWORD "root"
ENV MYSQL_DATABASE "nodeshop"
ENV MYSQL_LIMIT 50
ENV REDIS_HOST "192.168.1.11"
ENV REDIS_PASS "@#etpass"
# production  development
ENV NODE_ENV "production"
ENV PORT 1337


RUN apt-get update && apt-get install -y \
		imagemagick \
	--no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /node/sunshop
WORKDIR /node/sunshop

RUN npm config set registry https://registry.npm.taobao.org
RUN npm i node-gyp -g
RUN npm i pm2 -g
ADD api /node/sunshop
ADD assets /node/sunshop
ADD config /node/sunshop
ADD tasks /node/sunshop
ADD views /node/sunshop
ADD app.js /node/sunshop
ADD Gruntfile.js /node/sunshop
ADD package.json /node/sunshop
RUN npm i
VOLUME ["/node/sunshop/cert", "/node/sunshop/upload"]
EXPOSE PORT
CMD [ "pm2", "start", "--no-daemon", "app.js" ]
