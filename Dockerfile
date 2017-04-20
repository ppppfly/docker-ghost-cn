FROM alovez/nodejs_4.2.0

RUN mkdir /root/app
RUN mkdir /root/workspace

# copy app
COPY Ghost-0.7.4-zh.zip /root/workspace
WORKDIR /root/workspace
RUN unzip Ghost-0.7.4-zh.zip -d /root/app

# volume
VOLUME ["/root/app"]

# prepare modules
WORKDIR /root/app
RUN cp config.example.js config.js
RUN npm install --production

# expose port
EXPOSE 2368

# run server
ENTRYPOINT npm start