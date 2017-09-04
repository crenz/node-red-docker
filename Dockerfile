FROM nodered/node-red-docker

USER node-red

RUN npm install node-red-contrib-azureiothubnode
RUN npm install node-red-contrib-bit
RUN npm install node-red-contrib-chatbot
RUN npm install node-red-contrib-cognitive-services
RUN npm install node-red-dashboard
RUN npm install node-red-node-email
RUN npm install node-red-contrib-flatten
RUN npm install node-red-contrib-gzip
RUN npm install node-red-contrib-influxdb
RUN npm install node-red-contrib-msg-speed
RUN npm install node-red-contrib-opcua
RUN npm install node-red-contrib-os
RUN npm install node-red-contrib-polymer
RUN npm install node-red-contrib-predix-timeseries
RUN npm install node-red-contrib-pubnub
RUN npm install node-red-contrib-push
RUN npm install node-red-contrib-rhea
RUN npm install node-red-contrib-snowboy
RUN npm install node-red-contrib-splitter
RUN npm install node-red-node-sqlite
RUN npm install node-red-contrib-ttn
RUN npm install node-red-contrib-twitter-stream
RUN npm install node-red-contrib-viseo-api-ai
RUN npm install node-red-contrib-viseo-ms-oxford
RUN npm install node-red-contrib-wirelesstag

USER root

COPY start-node-red.sh /usr/src/node-red/
RUN chown -R node-red:node-red /usr/src/node-red/start-node-red.sh

USER node-red

CMD ./start-node-red.sh
