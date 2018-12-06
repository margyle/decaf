FROM resin/rpi-raspbian:latest

RUN apt-get update && \
    apt-get install -y build-essential libffi-dev libssl-dev \
                       python3 python3-dev python3-pip mysql-server && \
    rm -rf /var/lib/apt/lists/*
RUN pip3 install virtualenv
COPY ./ /var/www/decaf
RUN cd /var/www/decaf && virtualenv decaf && source ./decaf/bin/activate 
RUN pip3 install --upgrade setuptools && \
    pip3 install Flask Flask-RESTful Flask-MySQL simplejson RPi.GPIO && \
    rm -rf ~/.cache/pip

#COPY ./ /var/www/decaf

WORKDIR /var/www/decaf

ENTRYPOINT /etc/init.d/mysql start && \
           mysql < db/mugsy.sql && \
           python3 decaf.py
