#FROM alpine:3.10
FROM ubuntu:18.04

# Update
RUN apt-get -y -q update

# Install dependencies
RUN apt-get -y -q install wget unzip python3 python3-pip

# RUN apk -v --no-cache --update add \
#        musl-dev \
#        gcc \
#        python3 \
#        python3-dev

#RUN python3 -m ensurepip --upgrade \
#        && pip3 install --upgrade pip

RUN pip3 install --upgrade pip
        
RUN pip3 install --upgrade awscli aws-sam-cli
#RUN pip3 uninstall --yes pip \
#        && apk del python3-dev gcc musl-dev
#RUN apk add --update nodejs npm
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash
RUN apt-get install --yes nodejs
#RUN apt-get -y install nodejs
#RUN npm install
RUN apt-get install -y locales
RUN export LC_ALL=C.UTF-8
RUN export LANG=C.UTF-8

COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
