import sys
import os
from decafConfig import mysql
sys.path.insert(0,'helpers')
from barcodeHelper import scan, duringScan, afterScan
import RPi.GPIO as GPIO
import time
import itertools


class BrewSettings:
	def get(a):
		user = a		
		cur = mysql.connect().cursor()
		cur.execute("select * from mugsy.brewSettings WHERE userID=(%s)",user)
		r = [dict((cur.description[i][0], value)
			for i, value in enumerate(row)) for row in cur.fetchall()]
		return {'brewSettings' : r}

class CoffeeInfo:
	def get(a):
		coffeeTypeId = a		
		cur = mysql.connect().cursor()
		cur.execute("select * from mugsy.coffeeTypes WHERE coffeeTypeId=(%s)",coffeeTypeId)
		r = [dict((cur.description[i][0], value)
			for i, value in enumerate(row)) for row in cur.fetchall()]
		return {'brewSettings' : r}

class barcodeScanner:
	def get(self):
		count = 1
		while(count < 12):
			contents = scan()
			count = len(contents)
			duringScan()
		else:  
			for line in open("/var/mugsy/decaf/helpers/upc.txt"):
				last=line
				barcode = [last.rstrip('\n')]
				afterScan()
		cur = mysql.connect().cursor()
		cur.execute("select * from mugsy.coffeeTypes WHERE upc=(%s)",barcode)
		r = [dict((cur.description[i][0], value)
			for i, value in enumerate(row)) for row in cur.fetchall()]
		return {'coffeeInfo' : r}

class pinMappings:
	def get(a):
		hardwareType = a		
		cur = mysql.connect().cursor()
		cur.execute("select * from mugsy.pinMappings WHERE hardwareType=(%s)",hardwareType)
		r = [dict((cur.description[i][0], value)
			for i, value in enumerate(row)) for row in cur.fetchall()]
		return {'pinInfo' : r }

class relayControl:
	def get(a,b,c,d,e,f):
		GPIO.setmode(GPIO.BCM)
		pinNumber = a 
		relayChannel = b
		timeOn = float(c)
		repeatValue = int(d)
		repeatDelay = int(e)
		connectedHardware = f
		GPIO.setup(int(pinNumber), GPIO.OUT)
		if (repeatValue > 1):
			for _ in itertools.repeat(None, repeatValue):
				GPIO.output(int(pinNumber), GPIO.LOW)
				time.sleep(timeOn)
				GPIO.output(int(pinNumber), GPIO.HIGH)
				time.sleep(repeatDelay)
		else:
				GPIO.output(int(pinNumber), GPIO.LOW)
				time.sleep(timeOn)
				GPIO.output(int(pinNumber), GPIO.HIGH)
		response = [a,b,c,d,e,f]
		return {'relayController' : response }


















