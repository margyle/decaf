import sys
import os
import time
import itertools

try:
    import RPi.GPIO as GPIO
except ImportError:
    import helpers.gpio_mock as GPIO

from decafConfig import mysql
from helpers import barcode

class BrewSettings:
	@staticmethod
	def get(user):
		cur = mysql.connect().cursor()
		cur.execute("SELECT * FROM mugsy.brewSettings WHERE userID=(%s)",user)
		r = [dict((cur.description[i][0], value)
			for i, value in enumerate(row)) for row in cur.fetchall()]
		return {'brewSettings' : r}

class CoffeeInfo:
	@staticmethod
	def get(coffeeTypeId):
		cur = mysql.connect().cursor()
		cur.execute("SELECT * FROM mugsy.coffeeTypes WHERE coffeeTypeId=(%s)", coffeeTypeId)
		r = [dict((cur.description[i][0], value)
			for i, value in enumerate(row)) for row in cur.fetchall()]
		return {'brewSettings' : r}

class BarcodeScanner:
	@staticmethod
	def get():
		count = 1
		while(count < 12):
			contents = barcode.scan()
			count = len(contents)
			barcode.duringScan()
		else:  
			for line in open("/var/mugsy/decaf/helpers/upc.txt"):
				last=line
				upc = [last.rstrip('\n')]
				barcode.afterScan()
		cur = mysql.connect().cursor()
		cur.execute("SELECT * FROM mugsy.coffeeTypes WHERE upc=(%s)", upc)
		r = [dict((cur.description[i][0], value)
			for i, value in enumerate(row)) for row in cur.fetchall()]
		return {'coffeeInfo' : r}

class PinMappings:
	@staticmethod
	def get(hardwareType):
		cur = mysql.connect().cursor()
		cur.execute("SELECT * FROM mugsy.pinMappings WHERE hardwareType=(%s)",hardwareType)
		r = [dict((cur.description[i][0], value)
			for i, value in enumerate(row)) for row in cur.fetchall()]
		return {'pinInfo' : r }

class RelayControl:
	@staticmethod
	def get(pinNumber, relayChannel, timeOn, repeatValue, repeatDelay, connectedHardware):
		GPIO.setmode(GPIO.BCM)
		pinNumber = int(pinNumber)
		timeOn = float(timeOn)
		repeatValue = int(repeatValue)
		repeatDelay = int(repeatDelay)

		GPIO.setup(pinNumber, GPIO.OUT)
		if (repeatValue > 1):
			for _ in itertools.repeat(None, repeatValue):
				GPIO.output(pinNumber, GPIO.LOW)
				time.sleep(timeOn)
				GPIO.output(pinNumber, GPIO.HIGH)
				time.sleep(repeatDelay)
		else:
			GPIO.output(pinNumber, GPIO.LOW)
			time.sleep(timeOn)
			GPIO.output(pinNumber, GPIO.HIGH)
		GPIO.cleanup()
		
		response = {
			'pinNumber': pinNumber, 
			'relayChannel': relayChannel, 
			'timeOn': timeOn, 
			'repeatValue': repeatValue, 
			'repeatDelay': repeatDelay, 
			'connectedHardware': connectedHardware,
		}

		return {'relayController' : response}


















