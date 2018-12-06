# Decaf
Decaf is the Mugsy JSON API. And at least for now, that stands for *Does Every Coffee Action and Function*. 

Install(instructions in progress): 

 - touch decafConfig.py 
 - Edit decafConfig.py  and add:
```
from flaskext.mysql import MySQL  

mysql = MySQL()

dbuser = '************' 
dbpass = '************' 
dbdb = '************'
dbhost = '************'
```
