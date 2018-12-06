FROM resin/rpi-raspbian:latest

RUN apt-get update && \
    apt-get install -y python3 python3-dev python3-pip mysql-server && \
    rm -rf /var/lib/apt/lists/* && \
    pip3 install --upgrade setuptools && \
    pip3 install Flask Flask-RESTful Flask-MySQL simplejson RPi.GPIO && \
    rm -rf ~/.cache/pip

COPY ./ /var/www/decaf

WORKDIR /var/www/decaf

ENTRYPOINT /etc/init.d/mysql start && \
           mysql < db/mugsy.sql && \
           python3 decaf.py
