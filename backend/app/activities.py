import pymysql
import os
import json
import xmltodict
from .db import exdb
from flask import Blueprint, jsonify, flash, request, redirect, url_for
from werkzeug.utils import secure_filename
from datetime import datetime, timedelta
import re
from garmin_fit_sdk import Decoder, Stream
import math
import numbers
import time


activities_bp = Blueprint('activities', __name__)

# GET all activity records 
        
@activities_bp.route('/activities')
def activities():
    try:
        sport = request.args.get('sport')
        startdate = request.args.get('start')
        enddate = request.args.get('end')
        conn = exdb.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        sql = "SELECT * FROM activities WHERE (%s IS NULL OR sport = %s) AND date BETWEEN %s and %s"
        data = (sport, sport, startdate, enddate)
        cursor.execute(sql, data)
        activities = cursor.fetchall()
        print(activities)
        for activity in activities:
            print(activity['date'], activity['tzoffset'])   
            activity['date'] = activity['date'] + timedelta(hours=activity['tzoffset'])
        res = jsonify(activities)
        res.status_code = 200

        return res
    except Exception as e:
        print(e)
    finally:
        cursor.close() 
        conn.close()

# GET an individual activity by id

@activities_bp.route('/activities/<int:activityid>')
def activity(activityid):
    try:
        conn = exdb.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        # cursor = exdb.get_db().cursor() 
        sql = "SELECT * FROM activities WHERE id=%s"
        cursor.execute(sql, activityid)
        activity = cursor.fetchone()
        res = jsonify(activity)
        res.status_code = 200

        return res
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()

# GET the most recent x activity records 
        
@activities_bp.route('/activities/recent/<int:number>')
def recentactivities(number):
    try:
        conn = exdb.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        sql = "SELECT * FROM activities ORDER BY date DESC LIMIT %s"
        cursor.execute(sql, number)
        activities = cursor.fetchall()
        print(activities)
        for activity in activities:
            print(activity['date'], activity['tzoffset'])   
            activity['date'] = activity['date'] + timedelta(hours=activity['tzoffset'])
        res = jsonify(activities)
        res.status_code = 200

        return res
    except Exception as e:
        print(e)
    finally:
        cursor.close() 
        conn.close()

# Create new activity record        
    
@activities_bp.route('/activities', methods=['POST'])
def createactivity():
    try:
        newrecord = request.get_json()
        print(newrecord)
        sport = newrecord['sport']
        subsport = newrecord['subsport']
        format = '%Y-%m-%dT%H:%M:%S.%fZ'
        try:
            res = bool(datetime.strptime(newrecord['date'], '%Y-%m-%dT%H:%M:%S.%fZ'))
        except ValueError:
            format = '%Y-%m-%dT%H:%M:%SZ'
        new_format = '%Y-%m-%d %H:%M:%S'
        d = datetime.strptime(newrecord['date'], format)
        #d = dateutil.parser.parse(newrecord['date'])
        nd = d.strftime(new_format)
        
        duration = newrecord['duration']
        intensity = newrecord['intensity']
        distance = newrecord['distance']
        avgspeed = newrecord['avgspeed']
        latitude = newrecord['latitude']
        if latitude == '':
            latitude = None
        longitude = newrecord['longitude']
        if longitude == '':
            longitude = None
        hrmfile = newrecord['hrmfile']
        equipment = newrecord['equipment']
        if equipment == '':
            equipment = None
        heartrate = newrecord['heartrate']
        if heartrate == '':
            heartrate = 0
        comments = newrecord['comments']
        ascent = newrecord['ascent']
        calories = newrecord['calories']
        avgcadence = newrecord['avgcadence']
        avgpower = newrecord['avgpower']
        device = newrecord['device']
        name = newrecord['name']
        training_load = newrecord['training_load']
        workout_feel = newrecord['workout_feel']
        workout_rpe = newrecord['workout_rpe']
        ate = newrecord['ate']
        ante = newrecord['ante']
        tzoffset = newrecord['offset']
        if tzoffset == '':
            tzoffset = 0
    
        # insert activity record in database
        sqlQuery = "INSERT INTO activities(sport, subsport, date, duration, intensity, distance, avgspeed, latitude, longitude, hrmfile, equipment, heartrate, comments, ascent, calories, avgcadence, avgpower, device, name, training_load, workout_feel, workout_rpe, ate, ante, tzoffset) VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
        data = (sport, subsport, nd, duration, intensity, distance, avgspeed, latitude, longitude, hrmfile, equipment, heartrate, comments, ascent, calories, avgcadence, avgpower, device, name, training_load, workout_feel, workout_rpe, ate, ante, tzoffset)
        conn = exdb.connect()
        cursor = exdb.get_db().cursor() 
        cursor.execute(sqlQuery, data)
        conn.commit()
        
  
        return jsonify({
                    'res': 'Activity created successfully.',
                    'status': '200',
                    'msg': 'Success',
                    'no_of_books': 10
                })

        #return res
        
        
    except Exception as e:
        print(e)
    finally:
        cursor.close() 
        conn.close()
        print("Done!")

# Update activity record        
    
@activities_bp.route('/activities/<int:id>', methods=['PUT'])
def updateactivity(id):
    try:
        newrecord = request.get_json()
        print(newrecord)
        name = newrecord['name']

        format = '%Y-%m-%dT%H:%M:%S.%fZ'
        try:
            res = bool(datetime.strptime(newrecord['date'], '%Y-%m-%dT%H:%M:%S.%fZ'))
        except ValueError:
            format = '%Y-%m-%dT%H:%M:%SZ'
        new_format = '%Y-%m-%d %H:%M:%S'
        d = datetime.strptime(newrecord['date'], format)
        #d = dateutil.parser.parse(newrecord['date'])
        nd = d.strftime(new_format)

        sport = newrecord['sport']
        subsport = newrecord['subsport']
        duration = newrecord['duration']
        intensity = newrecord['intensity']
        distance = newrecord['distance']
        avgspeed = newrecord['avgspeed']
        latitude = newrecord['latitude']
        if latitude == '':
            latitude = None
        longitude = newrecord['longitude']
        if longitude == '':
            longitude = None
        equipment = newrecord['equipment']
        if equipment == '':
            equipment = None
        heartrate = newrecord['heartrate']
        if heartrate == '':
            heartrate = 0
        comments = newrecord['comments']
        ascent = newrecord['ascent']
        calories = newrecord['calories']
        avgcadence = newrecord['avgcadence']
        avgpower = newrecord['avgpower']
        device = newrecord['device']
        training_load = newrecord['training_load']
        workout_feel = newrecord['workout_feel']
        workout_rpe = newrecord['workout_rpe']
        ate = newrecord['ate']
        ante = newrecord['ante']
        tzoffset = newrecord['offset']
        if tzoffset == '':
            tzoffset = 0
        hrmfile = newrecord['hrmfile']
        secondhrmfile = newrecord['secondhrmfile']

        # update activity record in database
        sqlQuery = "UPDATE activities SET name = %s, date = %s, sport = %s, subsport = %s, duration = %s, intensity = %s, distance = %s, avgspeed = %s, latitude = %s, longitude = %s, equipment = %s, heartrate = %s, comments = %s, ascent = %s, calories = %s, avgcadence = %s, avgpower = %s, device = %s, training_load = %s, workout_feel = %s, workout_rpe = %s, ate = %s, ante = %s, tzoffset = %s, hrmfile = %s, secondhrmfile = %s WHERE id = %s"
        # 
        data = (name, nd, sport, subsport, duration, intensity, distance, avgspeed, latitude, longitude, equipment, heartrate, comments, ascent, calories, avgcadence, avgpower, device, training_load, workout_feel, workout_rpe, ate, ante, tzoffset, hrmfile, secondhrmfile, id)
        #  
        conn = exdb.connect()
        cursor = conn.cursor()
        cursor.execute(sqlQuery, data)
        conn.commit()
        
        res = jsonify('Activity updated successfully.')
        res.status_code = 200

        return res
        
    except Exception as e:
        print(e)
    finally:
        cursor.close() 
        conn.close()
        print("Activity Update Done!")

@activities_bp.route('/activities/bounds', methods=['GET'])
def get_activity_bounds():
    # Find the absolute first and last activity dates
    query = "SELECT MIN(date), MAX(date) FROM activities"
    cursor = exdb.get_db().cursor()
    cursor.execute(query)
    result = cursor.fetchone()
    
    return jsonify({
        "start": result[0], # e.g., "2023-01-15"
        "end": result[1]    # e.g., "2026-03-16"
    })
