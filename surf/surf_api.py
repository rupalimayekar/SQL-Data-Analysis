from flask import Flask, jsonify
import datetime as dt
import numpy as np
import pandas as pd

import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func


#################################################
# Get Data
#################################################

#################################################
# Flask Setup
#################################################
# Initialize your Flask app here
app = Flask(__name__)

#################################################
# Flask Routes
#################################################

# @TODO: Complete the routes for your app here
# YOUR CODE GOES HERE
@app.route("/")
def home():
    print("Server received request for 'Home' page...")
    text = "Welcome to the Surf's up in Hawaii API page!\n Below are some of the api endpoints that \
            you can use to get the weather data for Hawaii: \n\n \
            * /api/v1.0/precipitation \n\
            * /api/v1.0/temperature \n\
            * /api/v1.0/stations \n\
            * /api/v1.0/<start> \n\
            * /api/v1.0/<start>/<end>"
    return text

@app.route("/api/v1.0/precipitation")
def api():
    print("Server received request for precipitation page...")
    return "Below is the precipitation data for Hawaii for the previous year"

@app.route("/api/v1.0/precipitation")
def api():
    print("Server received request for temperature page...")
    return "Below is the temperature data for Hawaii for the previous year"

@app.route("/api/v1.0/stations")
def api():
    print("Server received request for stations page...")
    return "Below is the precipitation data for Hawaii for the previous year"

@app.route("/api/v1.0/<start>")
def api():
    print("Server received request for start page...")
    return "Below is the weather data for Hawaii from the start date"

@app.route("/api/v1.0/<start>/<end>")
def api():
    print("Server received request for start-end page...")
    return "Below is the weather data for Hawaii for the start and end dates"


#################################################
# Flask Run App
#################################################
if __name__ == "__main__":
    # Run the app
    app.run(debug=True)