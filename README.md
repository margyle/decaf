# Decaf
Decaf is the Mugsy JSON API. And at least for now, that stands for *Does Every Coffee Action, Friend*. 

Current Requirements:
 - Python 3
 - MySQL
 - Pip3

Install(instructions in progress): 
 - sudo pip3 install Flask
 - sudo pip3 install Flask-RESTful
 - sudo pip3 install Flask-MySQL
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
- edit following section of decaf.py
```
	app.run(host = '192.168.1.183', debug=True)

 - remove "host = '192.168.1.183'," to access endpoints from the local machine or
 - update 192.168.1.183 to local machine's ip to allow access from other computers on your network

 ```
 ### Start decaf by entering: sudo python3 decaf.py


 Access end point by pointing your browser or a curl request to: 
 
 http://192.168.1.183:5000/BrewSettings/1 
 http://192.168.1.183:5000/CoffeeInfo/2
 etc...
 
 dont forget to change the ip to your Pi's IP, or local host if your are browsing from the pi itself.
 ```
 ### Please note that this runs decaf on the Flask development server and is not meant for production!
 
 


 

