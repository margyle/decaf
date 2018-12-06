# Decaf
Decaf is the Mugsy JSON API. And at least for now, that stands for *Does Every Coffee Action and Function*. 

Install(instructions in progress): 
 - mkdir /var/mugsy 
 - cd /var/mugsy
 - git clone https://github.com/margyle/decaf.git
 - cd decaf
 - touch decafConfig.py 
 - import db/mugsy.sql into your mysql instance
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


```
 - remove "host = '192.168.1.183'," to access endpoints from the local machine or
 - update 192.168.1.183 to local machine's ip to allow access from other computers on your network
 - Start decaf by entering: sudo python decaf.py
 


 

