##################################################################################################
# This is a flask application that provides api end points for the weather data in Hawaii
# The home page specifies various end points. The end points returns a json response of the 
# requested data as per the endpoint url. All the data is taken from the SQLite database
# "hawaii.sqlite" in the Resources folder.
##################################################################################################

# import dependencies
from flask import Flask, jsonify
import datetime as dt
import pandas as pd

import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func


#################################################
# Database Setup
#################################################
engine = create_engine("sqlite:///Resources/hawaii.sqlite")

# reflect an existing database into a new model
Base = automap_base()

# reflect the tables
Base.prepare(engine, reflect=True)

# Save reference to the table
Stations = Base.classes.stations
Measurements = Base.classes.measurements

# Create our session (link) from Python to the DB
session = Session(engine)

#################################################
# Flask Setup
#################################################
# Initializing the Flask app
app = Flask(__name__)

#################################################
# Flask Routes
#################################################

# This is the home page of the application. It will list all the valid end points
@app.route("/")
def home():
    print("Server received request for 'Home' page...")
    text = "<strong>Welcome to the Surf API page!</strong><br/><br/>\
            Below are some of the api endpoints that you can use to get the weather data for Hawaii:<br/><br/> \
            * <strong>/api/v1.0/precipitation </strong> - To get the precipitation data for the last year<br/>\
            * <strong>/api/v1.0/temperature </strong> - To get the temperature data for the last year<br/>\
            * <strong>/api/v1.0/stations </strong> - To get the stations list<br/>\
            * <strong>/api/v1.0/start-date </strong> - To get the min, max and avg temperatures for all days starting the specified date<br/>\
            * <strong>/api/v1.0/start-date/end-date</strong> - To get the min, max and avg temperatures for all days between the specified dates"
    return text

# This end point lists all the precipitation data for all the days for the last year i.e. starting a year ago
@app.route("/api/v1.0/precipitation")
def get_precipitation():

    # server logging
    print("Server received request for precipitation page...")

    prev_year_date = dt.date.today() - dt.timedelta(days=365)

    # query precipitation data for the previous year
    results = session.query(Measurements.station_id, Measurements.date, Measurements.precipitation).\
                    filter(Measurements.date >= prev_year_date).\
                    order_by(Measurements.date)

    precipitation_data = []

    # Create a list of dictionaries to represent the data
    for row in results:
        p_dict = {}

        p_dict["date"]=row.date                
        p_dict["station_id"]=row.station_id
        p_dict["precipitation"]=row.precipitation
        precipitation_data.append(p_dict)

    # return the json representation of the data
    return jsonify(precipitation_data)

# This end point lists all the temperature data for all the days for the last year i.e. starting a year ago
@app.route("/api/v1.0/temperature")
def get_temperature():

    # server logging
    print("Server received request for temperature page...")

    prev_year_date = dt.date.today() - dt.timedelta(days=365)

    # query temperature data for the previous year
    results = session.query(Measurements.station_id, Measurements.date, Measurements.temperature).\
                    filter(Measurements.date >= prev_year_date).\
                    order_by(Measurements.date)

    temp_data = []

    # Create a list of dictionaries to represent the data
    for row in results:
        t_dict = {}

        t_dict["date"]=row.date                
        t_dict["station_id"]=row.station_id
        t_dict["temperature"]=row.temperature
        temp_data.append(t_dict)

    # return the json representation of the data
    return jsonify(temp_data)

# This end point lists all the station data
@app.route("/api/v1.0/stations")
def get_stations():

    # server logging
    print("Server received request for stations page...")

    results = session.query(Stations).all()
    
    # Create a dictionary from the row data and append to a list of stations
    all_stations = []

    for station in results:
        station_dict = {}

        station_dict["station_id"] = station.station_id
        station_dict["station_name"] = station.station_name
        station_dict["latitude"] = station.latitude
        station_dict["longitude"] = station.longitude
        station_dict["elevation"] = station.elevation
        all_stations.append(station_dict)

    # return the json representation of the data
    return jsonify(all_stations)

# This end point lists the min, max and avg temperatures for all days starting 
# from the start date specified in the end point
@app.route("/api/v1.0/<start>")
def get_weather_start(start):

    # server logging
    print("Server received request for start page...")
    
    try:
        start_date = dt.datetime.strptime(start, '%Y-%m-%d').date()
    except:
        return "Invalid endpoint value: {} <br/><br/>Please enter start date in the format <strong>YYYY-MM-DD</strong>".format(start)
    
    results = session.query(Measurements.date, func.min(Measurements.temperature).label("tmin"), \
                func.max(Measurements.temperature).label("tmax"), \
                func.avg(Measurements.temperature).label("tavg")).\
                filter(Measurements.date >= start_date).\
                group_by(Measurements.date).\
                order_by(Measurements.date)

    temp_data = []

    # Create a list of dictionaries to represent the data
    for row in results:
        t_dict = {}

        t_dict["date"]=row.date                
        t_dict["min temperature"]=row.tmin
        t_dict["max temperature"]=row.tmax
        t_dict["avg temperature"]=round(row.tavg,2)
        temp_data.append(t_dict)

    # return the json representation of the data
    return jsonify(temp_data)

# This end point lists the min, max and avg temperatures for all days 
# between the start date and end date specified in the end point
@app.route("/api/v1.0/<start>/<end>")
def get_weather_start_end(start, end):

    # server logging
    print("Server received request for start-end page...")
    try:
        start_date = dt.datetime.strptime(start, '%Y-%m-%d').date()
        end_date = dt.datetime.strptime(end, '%Y-%m-%d').date()
    except:
        return "Invalid endpoint value: {}/{} <br/><br/>Please enter start and end dates in the format <strong>YYYY-MM-DD</strong>".format(start, end)
    
    results = session.query(Measurements.date, func.min(Measurements.temperature).label("tmin"), \
                func.max(Measurements.temperature).label("tmax"), \
                func.avg(Measurements.temperature).label("tavg")).\
                filter(Measurements.date >= start_date).\
                filter(Measurements.date <= end_date).\
                group_by(Measurements.date).\
                order_by(Measurements.date)

    temp_data = []

    # Create a list of dictionaries to represent the data
    for row in results:
        t_dict = {}
        
        t_dict["date"]=row.date                
        t_dict["min temperature"]=row.tmin
        t_dict["max temperature"]=row.tmax
        t_dict["avg temperature"]=round(row.tavg,2)
        temp_data.append(t_dict)

    # return the json representation of the data
    return jsonify(temp_data)


#################################################
# Flask Run App
#################################################
if __name__ == "__main__":
    # Run the app
    app.run(debug=True)