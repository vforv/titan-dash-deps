FROM ubuntu:trusty


RUN apt-get -y -qq update



# xz-utils
RUN apt-get -y -qq install xz-utils
# zip
RUN apt-get -y -qq install zip
# git
RUN apt-get -y -qq install git
# python3
RUN apt-get -y -qq install python3.4-dev
# bash
RUN apt-get -y -qq install bash
# wget
RUN apt-get -y -qq install wget
# docker
RUN apt-get -y -qq install docker.io
# curl
RUN apt-get -y -qq install curl
# pip
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python3.4 get-pip.py
# aws cli
RUN pip install awscli --upgrade

# Install Google Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

RUN apt-get -y -qq update

RUN apt-get install -y google-chrome-stable

RUN apt-get -y -qq install phantomjs

# node and npm
RUN wget -O /node-v6.11.3-linux-x64.tar.xz "https://nodejs.org/dist/v6.11.3/node-v6.11.3-linux-x64.tar.xz"
RUN tar xf /node-v6.11.3-linux-x64.tar.xz
RUN rm -rf /node-v6.11.3-linux-x64.tar.xz
RUN mv /node-v6.11.3-linux-x64 /node
RUN ln -s /node/bin/node /usr/bin/node
RUN ln -s /node/bin/npm /usr/bin/npm
