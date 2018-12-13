from flask import Flask, request, jsonify, make_response
from flask_restful import Resource, Api
from flask.views import MethodView
from flaskext.mysql import MySQL
import simplejson as json

from decafConfig import mysql, dbuser, dbpass, dbdb, dbhost
import models

app = Flask(__name__)
api = Api(app)
app.config['MYSQL_DATABASE_USER'] = dbuser
app.config['MYSQL_DATABASE_PASSWORD'] = dbpass
app.config['MYSQL_DATABASE_DB'] = dbdb
app.config['MYSQL_DATABASE_HOST'] = dbhost

mysql.init_app(app)


#query brew settings by user id
class BrewSettings(Resource):
	def get(self, userId):
		return {'brewSettings': models.BrewSettings.get(userId)}

#get info about coffee by coffeeTypeID
class CoffeeInfo(Resource):
	def get(self, coffeeTypeId):
		return {'coffeeInfo': models.CoffeeInfo.get(coffeeTypeId)}

#get coffee info by using the barcode scanner
class BarCode(Resource):
	def get(self):
		return {'barcodeScanner': models.BarcodeScanner.get()}

class RelayController(Resource):
	def get(self, pinNumber, relayChannel, timeOn, repeatValue, repeatDelay, connectedHardware):
		return {'relayControl': models.RelayControl.get(pinNumber, relayChannel, timeOn, repeatValue, repeatDelay, connectedHardware)}

class PinInfo(Resource):
	def get(self, hardwareType):
		return {'pinMappings': models.PinMappings.get(hardwareType)}

api.add_resource(BrewSettings, '/brewSettings/<int:userId>')
api.add_resource(CoffeeInfo, '/coffeeInfo/<int:coffeeTypeId>')
api.add_resource(BarCode, '/barcodeScanner')
api.add_resource(PinInfo, '/pinInfo/<hardwareType>')
api.add_resource(RelayController, '/relayControl/<int:pinNumber>/<int:relayChannel>/<timeOn>/<int:repeatValue>/<int:repeatDelay>/<string:connectedHardware>')

if __name__ == "__main__":
  #remove in production
	app.run(host='0.0.0.0', debug=True)




