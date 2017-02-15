FROM nodered/node-red-docker

USER root

COPY start-node-red.sh /usr/src/node-red/
RUN chown -R node-red:node-red /usr/src/node-red/start-node-red.sh

USER node-red


RUN npm install node-red-contrib-rhea
RUN npm install node-red-contrib-influxdb


CMD ./start-node-red.sh
