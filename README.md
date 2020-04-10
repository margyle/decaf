# Decaf
Decaf is the Mugsy JSON API. And at least for now, that stands for *Does Every Coffee Action, Friend*. 

## Install on Raspbian

Current Requirements:

 - python 3
 - pip

Install on Raspberry Pi:
(instructions in progress)

 - sudo pip3 install -r requirements.txt
 - mkdir /var/mugsy 
 - cd /var/mugsy
 - git clone https://github.com/margyle/decaf.git
 - cd decaf
 - run `python3 -m db` for creating sqlite db


### Start decaf by entering: sudo python3 decaf.py

 Access end point by pointing your browser or a curl request to: 
 
 http://192.168.1.183:5000/brewSettings/1 
 http://192.168.1.183:5000/coffeeInfo/2
 etc...
 
 dont forget to change the ip to your Pi's IP, or local host if your are browsing from the pi itself.

#### Relay control formatting

It currently requires 5 arguments:
* `pin` (int) GPIO Pin Number
* `channel` (int) Relay Channel
* `timeOn` (float) Total running time
* `repeat` (int) Number of times to repeat
* `repeatDelay` (float) Delay between repeat times

Example:
```
POST http://192.168.1.183:5000/relayControl/grinder HTTP/1.1
Content-Type: application/json

{"pin":23,"channel":1,"timeOn":1.0,"repeat":3,"repeatDelay":2.0}
```
This turns on pin 23 which is connected to relay channel 1 for 2 seconds, it repeats 2 times with a delay of 4 seconds between repeats and is connected to the grinder.

#### Get Pin Info By Hardware Type:
Access pinInfo by pointing your browser or a curl request to: 
http://192.168.1.183:5000/pinInfo/grinder


### Please note that this runs decaf on the Flask development server and is not meant for production!

## Run on Docker on Raspbian

1. Install Git and [Docker CE](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-convenience-script)
2. `git clone https://github.com/margyle/decaf.git && cd decaf`
3. `docker build -t heymugsy .`
4. `docker run -p 5000:5000 heymugsy`
