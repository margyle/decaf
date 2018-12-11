from models import BrewSettings, CoffeeInfo, barcodeScanner, relayControl, pinMappings
from flask import Flask, request, jsonify, make_response
from flask_restful import Resource, Api
from flask.views import MethodView
from flaskext.mysql import MySQL
from decafConfig import mysql, dbuser, dbpass, dbdb, dbhost
import simplejson as json


app = Flask(__name__)
api = Api(app)
app.config['MYSQL_DATABASE_USER'] = dbuser
app.config['MYSQL_DATABASE_PASSWORD'] = dbpass
app.config['MYSQL_DATABASE_DB'] = dbdb
app.config['MYSQL_DATABASE_HOST'] = dbhost

mysql.init_app(app)


#query brew settings by user id
class brewSettings(Resource):
	def get(self, userId):
		return {'brewSettings': BrewSettings.get(userId)}

#get info about coffee by coffeeTypeID
class coffeeInfo(Resource):
	def get(self, coffeeTypeId):
		return {'CoffeeInfo': CoffeeInfo.get(coffeeTypeId)}

#get coffee info by using the barcode scanner
class barCode(Resource):
	def get(self):
		return {'barcodeScanner': barcodeScanner.get(self)}

class relayController(Resource):
	def get(self, pinNumber, relayChannel, timeOn, repeatValue, repeatDelay, connectedHardware):
		return {'relayControl': relayControl.get(pinNumber, relayChannel, timeOn, repeatValue, repeatDelay, connectedHardware)}

class pinInfo(Resource):
	def get(self, hardwareType):
		return {'pinMappings': pinMappings.get(hardwareType)}

api.add_resource(brewSettings, '/BrewSettings/<int:userId>')
api.add_resource(coffeeInfo, '/CoffeeInfo/<int:coffeeTypeId>')
api.add_resource(barCode, '/barcodeScanner/', methods=['GET'])
api.add_resource(pinInfo, '/pinInfo/<hardwareType>')
api.add_resource(relayController, '/relayControl/<int:pinNumber>/<int:relayChannel>/<timeOn>/<int:repeatValue>/<int:repeatDelay>/<string:connectedHardware>')


if __name__ == "__main__":
  #remove in production
	app.run(host='0.0.0.0', debug=True)




