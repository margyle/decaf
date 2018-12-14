# Decaf
Decaf is the Mugsy JSON API. And at least for now, that stands for *Does Every Coffee Action, Friend*. 

## Install on Raspbian

Current Requirements:

 - Python 3
 - MySQL
 - Pip3
 - VirtualEnv

Install(instructions in progress):

 - sudo pip3 install -r requirements.txt
 - mkdir /var/mugsy 
 - cd /var/mugsy
 - git clone https://github.com/margyle/decaf.git
 - import db/mugsy.sql into your mysql instance
 - cd decaf
 - touch decafConfig.py 
 - Edit decafConfig.py and add:
   
```
from flaskext.mysql import MySQL  

mysql = MySQL()

dbuser = '************' 
dbpass = '************' 
dbdb = '************'
dbhost = '************'
```
**Enter your mysql settings in place of asterisks**

### Start decaf by entering: sudo python3 decaf.py


 Access end point by pointing your browser or a curl request to: 
 
 http://192.168.1.183:5000/brewSettings/1 
 http://192.168.1.183:5000/coffeeInfo/2
 etc...
 
 dont forget to change the ip to your Pi's IP, or local host if your are browsing from the pi itself.

#### Relay control formatting:

It currently requires 6 arguments:
* pinNumber
* relayChannel
* timeOn
* repeatValue
* repeatDelay
* connectedHardware

Example:
http://192.168.1.183:5000/relayControl/23/1/2/2/4/grinder

This turns on pin 23 which is connected to relay channel 1 for 2 seconds, it repeats 2 times with a delay of 4 seconds between repeats and is connected to the grinder.

#### Get Pin Info By Hardware Type:
Access pinInfo by pointing your browser or a curl request to: 
http://192.168.1.183:5000/pinInfo/grinder


 ### Please note that this runs decaf on the Flask development server and is not meant for production!

## Run on Docker on Raspbian

1. Install Git and [Docker CE](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-convenience-script)
2. `git clone https://github.com/margyle/decaf.git && cd decaf`
3. Edit config file as above. `dbhost = 'localhost'`, `dbuser = 'root'`, `dbpass = ''`, `dbdb = 'mugsy'`
4. `docker build -t heymugsy .`
5. `docker run -it --rm --privileged -p 5000:5000 -v /var/lib/mysql heymugsy`

