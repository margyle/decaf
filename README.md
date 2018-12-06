# Decaf
Decaf is the Mugsy JSON API. And at least for now, that stands for *Does Every Coffee Action and Function*. 

Install(instructions in progress): 
 - mkdir /var/mugsy 
 - cd /var/mugsy
 - git clone https://github.com/margyle/decaf.git
 - cd decaf
 - touch decafConfig.py 
 - Edit decafConfig.py  and add:
 - import db/mugsy.sql into your mysql instance
   
```
from flaskext.mysql import MySQL  

mysql = MySQL()

dbuser = '************' 
dbpass = '************' 
dbdb = '************'
dbhost = '************'
```
**Enter your db settings in place of asterisks**


