from flask import Flask, request, abort
from flask_restful import Resource, Api

import models

app = Flask(__name__)
api = Api(app)


# query brew settings by user id
class BrewSettings(Resource):
    def get(self, userId):
        return {"brewSettings": models.BrewSettings.get(userId)}


# get info about coffee by coffeeTypeID
class CoffeeInfo(Resource):
    def get(self, coffeeTypeId):
        return {"coffeeInfo": models.CoffeeInfo.get(coffeeTypeId)}


# get coffee info by using the barcode scanner
class BarCode(Resource):
    def post(self):
        return {"barcodeScanner": models.BarcodeScanner.get()}


class RelayController(Resource):
    def post(self, hardware):
        req = request.get_json(force=True)
        if req is None:
            return abort(400)
        try:
            return {
                "relayControl": models.RelayControl.get(
                    req["pin"],
                    req["channel"],
                    req["timeOn"],
                    req["repeat"],
                    req["repeatDelay"],
                    hardware,
                )
            }
        except KeyError:
            return abort(400)


class PinInfo(Resource):
    def get(self, hardwareType):
        return {"pinMappings": models.PinMappings.get(hardwareType)}


api.add_resource(BrewSettings, "/brewSettings/<int:userId>")
api.add_resource(CoffeeInfo, "/coffeeInfo/<int:coffeeTypeId>")
api.add_resource(BarCode, "/barcodeScanner")
api.add_resource(PinInfo, "/pinInfo/<hardwareType>")
api.add_resource(RelayController, "/relayControl/<hardware>")

if __name__ == "__main__":
    # remove in production
    app.run(host="0.0.0.0", debug=True)
