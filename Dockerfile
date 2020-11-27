FROM ubuntu
FROM node:14

RUN apt-get update && apt-get install -y git
RUN mkdir /home/code
WORKDIR /home/code

RUN git clone https://github.com/Dukes-Wine-Co/contact-service.git
RUN git clone https://github.com/Dukes-Wine-Co/contact-service-api.git

# Install packages
RUN npm config set loglevel warn \
# To mitigate issues with npm saturating the network interface we limit the number of concurrent connections
    && npm config set maxsockets 5 \
    && npm config set only production \
    && npm config set progress false

WORKDIR /home/code/contact-service-api
RUN npm install

WORKDIR /home/code/contact-service
RUN npm install

RUN npm i -g nodemon
#RUN npm install -g pm2@1.1.3

EXPOSE 3000
#EXPOSE 3001
CMD ["npm", "run", "dev"]
