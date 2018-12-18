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
	def get(pin, channel, timeOn, repeat, repeatDelay, hardware):
		pin = int(pin)
		timeOn = float(timeOn)
		repeat = int(repeat)
		repeatDelay = float(repeatDelay)

		GPIO.setmode(GPIO.BCM)
		GPIO.setup(pin, GPIO.OUT)
		if (repeat > 1):
			for _ in itertools.repeat(None, repeat):
				GPIO.output(pin, GPIO.LOW)
				time.sleep(timeOn)
				GPIO.output(pin, GPIO.HIGH)
				time.sleep(repeatDelay)
		else:
			GPIO.output(pin, GPIO.LOW)
			time.sleep(timeOn)
			GPIO.output(pin, GPIO.HIGH)
		GPIO.cleanup()
		
		response = {
			'pin': pin, 
			'channel': channel, 
			'timeOn': timeOn, 
			'repeat': repeat, 
			'repeatDelay': repeatDelay, 
			'hardware': hardware,
		}

		return {'relayController' : response}


















