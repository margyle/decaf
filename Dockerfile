FROM resin/rpi-raspbian:latest

RUN apt-get update && \
    apt-get install -y build-essential libffi-dev libssl-dev \
                       python3 python3-dev python3-pip && \
    rm -rf /var/lib/apt/lists/*
RUN pip3 install virtualenv

RUN virtualenv decaf

COPY . /var/mugsy/decaf

WORKDIR /var/mugsy/decaf

RUN /decaf/bin/pip3 install -r requirements.txt

RUN python3 -m db.py

ENTRYPOINT /decaf/bin/python3 decaf.py
