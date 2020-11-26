FROM ubuntu
FROM node:12

RUN apt-get update \
      apt-get intall -y git

RUN mkdir /home/code \
      cd /home/code

RUN git clone

EXPOSE 3000
