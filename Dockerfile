FROM resin/rpi-raspbian:latest

RUN apt-get update && \
    apt-get install -y build-essential libffi-dev libssl-dev \
                       python3 python3-dev python3-pip && \
    rm -rf /var/lib/apt/lists/*


COPY . /var/mugsy/decaf

WORKDIR /var/mugsy/decaf

RUN pip3 install -r requirements.txt

RUN python3 -m db  # init db schema

ENTRYPOINT python3 decaf.py
