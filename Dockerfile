FROM alovez/nodejs_4.2.0

RUN mkdir /app
RUN mkdir /root/workspace

# copy app
COPY Ghost-0.7.4-zh-full.zip /root/workspace
WORKDIR /root/workspace
RUN unzip Ghost-0.7.4-zh-full.zip -d /app

# volume
VOLUME ["/app/content/data"]

# prepare modules
WORKDIR /app
COPY config.js .
RUN sed -i "s/127.0.0.1/0.0.0.0/g" config.js

# expose port
EXPOSE 2368

# run server
ENTRYPOINT npm start --production