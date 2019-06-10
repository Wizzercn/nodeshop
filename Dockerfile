FROM node:6.2
# Author
MAINTAINER wizzer "wizzer@qq.com"
ENV PORT 1337
RUN apt-get update && apt-get install -y \
		imagemagick \
	--no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /node/sunshop
WORKDIR /node/sunshop

RUN npm config set registry https://registry.npm.taobao.org
RUN npm i node-gyp -g
RUN npm i pm2 -g
ADD api /node/sunshop/api
ADD assets /node/sunshop/assets
ADD config /node/sunshop/config
ADD tasks /node/sunshop/tasks
ADD views /node/sunshop/views
ADD app.js /node/sunshop
ADD Gruntfile.js.bak /node/sunshop
ADD package.json /node/sunshop
RUN npm i
EXPOSE ${PORT}
ENV LANG C.UTF-8
ENV TZ "Asia/Shanghai"
VOLUME ["/node/sunshop/cert", "/node/sunshop/upload", "/node/sunshop/backup"]
CMD [ "pm2", "start", "--no-daemon", "app.js" ]

