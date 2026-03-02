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
import pymysql
#import dateutil.parser

main_bp = Blueprint('main', __name__)
       
# Upload picture      
    
@main_bp.route('/upload', methods=['POST'])
def uploadpicture():
    
    UPLOAD_FOLDER = '/srv/md0/www/recipes/pics'
    ALLOWED_EXTENSIONS = {'txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'}
    try:
        #newrecord = request.get_json()
        #print(newrecord)
        
        if request.method == 'POST':
            if 'file' not in request.files:
                flash('No file part')
                return redirect(request.url)
            #f = request.form['file']
                file = request.files['file']
            #filenum = f.filenum
            for key in file:
                print(key)
            print(file)
            if file.filename == '':
                flash('No selected file')
                return redirect(request.url)
            if file and allowed_file(file.filename):
                filename = secure_filename(file.filename)
                file.save(os.path.join(UPLOAD_FOLDER, filename))
                return redirect(url_for('download_file', name=filename))
            #print(f.items())
            #file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
            #f.save(os.path.join('/srv/md0/www/recipes/pics', filenum))
        
        
        return jsonify({
                    'res': 'Photo uploaded successfully.',
                    'status': '200',
                    'msg': 'Success',
                    'no_of_books': 10
                })
        
    except Exception as e:
        print(e)
    finally:
        print("Picture Upload Done!")
        
# Upload hrm file
    
@main_bp.route('/uploadhrm2', methods=['POST'])
def uploadhrm2():
    
    UPLOAD_FOLDER = '/srv/md0/data/gps/fit'
    ALLOWED_EXTENSIONS = {'fit', 'tcx'}
    
    if 'file' not in request.files:
        return 'No file part in the request', 400
    
    try:
        #newrecord = request.get_json()
        print(request.files['file'])
        
        for key, value in request:
            print(f"{key}: {value}")
        
        if request.method == 'POST':
            #if 'file' not in request.files:
            #    print('No file part')
            #    return redirect(request.url)
            #f = request.form['file']
            file = request.files['file']
            #filenum = f.filenum
            for key in file:
                print(key)
            print(file)
            if file.filename == '':
                print('No selected file')
                return redirect(request.url)
            if file and allowed_file(file.filename):
                filename = secure_filename(file.filename)
                file.save(os.path.join(UPLOAD_FOLDER, filename))
                return redirect(url_for('download_file', name=filename))
            #print(f.items())
            #file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
            #f.save(os.path.join('/srv/md0/www/recipes/pics', filenum))
        
        
        return jsonify({
                    'res': 'HRM File Sucessfully Uploaded.',
                    'status': '200',
                    'msg': 'Success'
                })
        
    except Exception as e:
        print(e)
    finally:
        print("HRM Upload Done!")
        
@main_bp.route('/uploadhrm', methods=['POST'])
def uploadhrm():
    
    UPLOAD_FOLDER = '/srv/md0/data/gps/fit'

    
    if 'file' not in request.files:
        return 'No file part in the request', 400
    
    file = request.files['file']

    if file.filename == '':
        return 'No file selected', 400

    file.save(os.path.join(UPLOAD_FOLDER, file.filename))
    return 'File uploaded successfully'
        
# GET all activity records 
        
@main_bp.route('/activities')
def activities():
    try:
        startdate = request.args.get('start')
        enddate = request.args.get('end')
        conn = exdb.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        # cursor = exdb.get_db().cursor() 
        print(startdate, enddate)
        sql = "SELECT * FROM activities WHERE date BETWEEN %s and %s"
        data = (startdate, enddate)
        #sql = "SHOW TABLES"
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
        
# GET all sport records 
        
@main_bp.route('/sports')
def sports():
    try:
        conn = exdb.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        # cursor = exdb.get_db().cursor() 
        sql = "SELECT * FROM sports ORDER BY name"
        #sql = "SHOW TABLES"
        cursor.execute(sql)
        sports = cursor.fetchall()
        res = jsonify(sports)
        res.status_code = 200

        return res
    except Exception as e:
        print('Error fetching sports: ', e)
    finally:
        cursor.close() 
        conn.close()
        
# GET a subsport based on passed sport

@main_bp.route('/subsport/<int:sportid>')
def subsports(sportid):
    try:
        conn = exdb.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        # cursor = exdb.get_db().cursor() 
        sql = "SELECT * FROM subsport WHERE sportid=%s"
        #sql = "SHOW TABLES"
        cursor.execute(sql, sportid)
        subsports = cursor.fetchall()
        res = jsonify(subsports)
        res.status_code = 200

        return res
    except Exception as e:
        print(e)
    finally:
        cursor.close() 
        conn.close()
        
@main_bp.route('/equipment/<int:eqid>')
def equipment(eqid):
    try:
        conn = exdb.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        # cursor = exdb.get_db().cursor() 
        sql = "SELECT * FROM equipment WHERE sportid=%s"
        #sql = "SHOW TABLES"
        cursor.execute(sql, eqid)
        equipment = cursor.fetchall()
        res = jsonify(equipment)
        res.status_code = 200

        return res
    except Exception as e:
        print(e)
    finally:
        cursor.close() 
        conn.close()

# GET an individual activity by id

@main_bp.route('/activities/<int:activityid>')
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
        
# update activity record        
    
@main_bp.route('/activities/<int:id>', methods=['PUT'])
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
        
# create new activity record        
    
@main_bp.route('/activities', methods=['POST'])
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

    
    
# GET the contents of an HRM file V 3

@main_bp.route('/hrm3/<hrmfile>')
def readhrm3(hrmfile):
    file_name, file_extension = os.path.splitext(hrmfile)
    base_path = '/home/david/Programming/reActive/backend/test_files/'

    
    if file_extension == '.tcx':
        base_path = base_path + 'tcx/' #'/srv/md0/data/gps/tcx/'
        with open(base_path+hrmfile) as xml_file:
            data_dict = xmltodict.parse(xml_file.read())
            res=jsonify(data_dict)
            res.status_code = 200
            return res
    elif file_extension == '.fit':
        base_path = base_path + 'fit/'
        
        data_dict = {}
        activity = {}
        laps = {}
        datapoint = {}
        track = {}
        tracks = {}
        li = 0
        lapindex = {}
        ti = {}
        ct = 0
        lnct = 0
        ctlaps = 0
        st = 0
        set_list = {}
        ctlaps = 0
        ctlens = 0
        has_laps = False
        has_lengths = False
        
        stream = Stream.from_file(base_path+hrmfile)
        decoder = Decoder(stream)
        messages, errors = decoder.read()
        
        # Process the activity record and create the base dict
        start_time = time.perf_counter()
   
        for record in messages['activity_mesgs']:
            for field_name in record:
                if isinstance(field_name, int):
                    continue
                field_value = record[field_name]
                try:
                    if math.isnan(field_value):
                        continue
                except:
                    a=1
                if field_value != None:
                    if isinstance(field_value, datetime):
                        field_value = field_value.strftime("%Y-%m-%dT%H:%M:%S.%fZ")
                    if 'local_timestamp' in field_name:
                        field_value = datetime.fromtimestamp(field_value+631080000)
                #    if 'device' in data.name:
                #        #data.value = 'Forerunner 965'
                #        print ('Device'+data.value+'|')
                #    print (data.name)
                #    key = data.name
                    activity[field_name] = field_value
            data_dict['Activities'] = activity
            
        # Add session data to the activity dict
                
        for record in messages['session_mesgs']:
            for field_name in record:
                if isinstance(field_name, int):
                    continue
                field_value = record[field_name]
                try:
                    if math.isnan(field_value):
                        continue
                except:
                    a=1
                if not re.search('unknown', field_name) and field_value != None and field_value != (None, None) and field_value != (None, None, None, None):
                    if isinstance(field_value, datetime):
                        field_value = field_value.strftime("%Y-%m-%dT%H:%M:%S.%fZ")
                    if 'lat' in field_name or 'long' in field_name:
                        field_value = field_value / ((2**32)/360)
                    activity[field_name] = field_value
            data_dict['Activities'] |= activity
            
        # Process laps and add them as a child dict to the activity dict
        
        try:
            data_dict['Activities'] |= {'Lap': {}}
            for record in messages['lap_mesgs']:
                has_laps = True
                lap = {}
                for field_name in record:
                    if isinstance(field_name, int):
                        continue
                    field_value = record[field_name]
                    try:
                        if math.isnan(field_value):
                            continue
                    except:
                        a=1
                    if not re.search('unknown', field_name) and field_value != None and field_value != (None, None) and field_value != (None, None, None, None):
                        if isinstance(field_value, datetime):
                            field_value = field_value.strftime("%Y-%m-%dT%H:%M:%S.%fZ")
                            starttime = field_value
                        if 'lat' in field_name or 'long' in field_name:
                            field_value = field_value / ((2**32)/360)
                        lap[field_name] = field_value
                format = '%Y-%m-%dT%H:%M:%S.%fZ'
                lap['end_time'] = datetime.strptime(lap['start_time'],format) + timedelta(seconds=lap['total_elapsed_time'])
                # print(lap)
                laps[li] = lap
                data_dict['Activities']['Lap'] |= laps
                data_dict['Activities']['Lap'][li] |= {'Track': {}}
                tracks[li] = {}
                ti[li] = 0
                li += 1

        except:
            has_laps = False
        
        #if li <=1:
         #   has_laps = False
        print ("has laps: ", has_laps)

        # Process pool lenghts and add them to corresponding laps
    
        if has_laps:
            for lap in data_dict['Activities']['Lap']:
                data_dict['Activities']['Lap'][lap] |= {'Length': {}}
                tracks[lap] = {}
                ti[lap] = 0
            
    
            #lapindex[lap] = 0
                
        try:
            for length in messages['length_mesgs']:
                has_lengths = True
                lnct += 1
                track = {}
                found = -1
                for field_name in length:
                    field_value = length[field_name]
                    if not re.search('unknown', field_name) and field_value != None:
                        if isinstance(field_value, datetime):
                            field_value = field_value.strftime("%Y-%m-%dT%H:%M:%S.%fZ")
                        track[field_name] = field_value
                length_index = track['message_index']
                for lap in data_dict['Activities']['Lap']:
                    first_length = data_dict['Activities']['Lap'][lap]['first_length_index']
                    num_lengths = data_dict['Activities']['Lap'][lap]['num_lengths']
                    if num_lengths == 0:
                        num_lengths = 1
                    #data_dict['Activities']['Lap'][lap] |= {'Length': {}}
                    if first_length <= length_index < first_length + num_lengths:
                        found = lap
                        data_dict['Activities']['Lap'][lap]['Length'][length_index]=track
                        break
                   
        except Exception as error:
            print(error)
            
        # Read the trackpoint records
        # add them to the corresponding lap record and to a flat list of trackpoints
        
        if has_laps:
            # for lap in data_dict['Activities']['Lap']:
                # data_dict['Activities']['Lap'][lap] |= {'Track': {}}
                # tracks[lap] = {}
                # ti[lap] = 0

            flat_tracks = {}

            try:
                for trackpoint in messages["record_mesgs"]:
                    ct += 1
                    track = {}
                    found = -1
                    for field_name in trackpoint:
                        #if isinstance(field_name, int):
                        #    continue
                        field_value = trackpoint[field_name]
                        #if isinstance(field_value, numbers.Number):
                        #    if math.isnan(field_value):
                        #        print("Not a number")
                        #        continue
                        try:
                            if math.isnan(field_value):
                                continue
                        except:
                            a = 1
                        try:
                            if not re.search('unknown', field_name) and field_value != None:
                                if isinstance(field_value, datetime):
                                    field_value = field_value.strftime("%Y-%m-%dT%H:%M:%S.%fZ")
                                if 'lat' in field_name or 'long' in field_name:
                                    field_value = field_value / ((2**32)/360)
                                track[field_name] = field_value
                        except:
                            continue
                    for lap in data_dict['Activities']['Lap']:
                        if datetime.strptime(data_dict['Activities']['Lap'][lap]['start_time'], format) < datetime.strptime(track['timestamp'], format) <= data_dict['Activities']['Lap'][lap]['end_time']:
                            found = lap
                            break
                    if found == -1:
                        print ('missed', data_dict['Activities']['Lap'][lap]['start_time'], activity['timestamp'], data_dict['Activities']['Lap'][lap]['end_time'])
                    else:
                        tracks[found][ti[lap]] = track
                        ti[lap] += 1 
                    flat_tracks[ct] = track
        
                for lap in data_dict['Activities']['Lap']:
                    data_dict['Activities']['Lap'][lap]['Track'] = tracks[lap]
                    ctlaps += len(tracks[lap])
                data_dict['Activities']['Track'] = flat_tracks

            except Exception as error:
                print(error)
        else:

            try:
                for trackpoint in messages["record_mesgs"]:
                    track = {}
                    for field_name in trackpoint:
                        field_value = trackpoint[field_name]
        
                        try:
                            if not re.search('unknown', field_name) and field_value != None:
                                if isinstance(field_value, datetime):
                                    field_value = field_value.strftime("%Y-%m-%dT%H:%M:%S.%fZ")
                                if 'lat' in field_name or 'long' in field_name:
                                    field_value = field_value / ((2**32)/360)
                                track[field_name] = field_value
                        except:
                            continue
                    tracks[ct] = track
                    ct += 1
        
                data_dict['Activities']['Track'] = tracks
                
            except Exception as error:
                print(error)
       
       
        # Process sets and add them as a child dict to the activity dict
        
        try:
            for sets in messages["set_mesgs"]:
                set_rec = {}

                for field_name in sets:
                    field_value = sets[field_name]

                    try:
                        if not re.search('unknown', field_name) and field_value != None:
                            if isinstance(field_value, datetime):
                                field_value = field_value.strftime("%Y-%m-%dT%H:%M:%S.%fZ")
                            if 'lat' in field_name or 'long' in field_name:
                                field_value = field_value / ((2**32)/360)
                            set_rec[field_name] = field_value
                    except Exception as error:
                        print(error)
                        continue
                    
                set_list[st] = set_rec
                st += 1
    
            if st:
                data_dict['Activities']['Sets'] = set_list
    
        except Exception as error:
            print(error)
            
        # Process time in zones
        try:
            data_dict['Activities'] |= {'Zones': {}}
            for record in messages['time_in_zone_mesgs']:
                zone = {}
                for field_name in record:
                    if isinstance(field_name, int):
                        continue
                    field_value = record[field_name]
                    try:
                        if math.isnan(field_value):
                            continue
                    except:
                        a=1
                    if not re.search('unknown', field_name) and field_value != None and field_value != (None, None) and field_value != (None, None, None, None):
                        if isinstance(field_value, datetime):
                            field_value = field_value.strftime("%Y-%m-%dT%H:%M:%S.%fZ")
                            starttime = field_value
                        zone[field_name] = field_value
            data_dict['Activities']['Zones'] |= zone
        except:
            has_laps = False
            
         # Read the device name from the file ID    
        end_time = time.perf_counter()
        elapsed_time = end_time - start_time
        print(f"Execution took: {elapsed_time:.4f} seconds (Wall clock time)")
                    
        datapoint.clear()
        for file_id_step in messages['file_id_mesgs']:
            for field_name in file_id_step:
                field_value = file_id_step[field_name]
                if field_name == 'product':
                    if field_value == 4315:
                        field_value = 'Forerunner 965'
                    elif field_value == 3121:
                        field_value = 'Edge 530'
                    datapoint = {'device' : field_value}

        data_dict['Activities'].update(datapoint)
            
        # Read user profile data
        
        try:    
            datapoint.clear()
            for profile_step in messages['user_profile_mesgs']:
                for field_name in profile_step:
                    field_value = profile_step[field_name]
                    if field_name == 'wake_time':
                        datapoint = {field_name : field_value}
                        data_dict['Activities'].update(datapoint)
                    elif field_name == 'sleep_time':
                        datapoint = {field_name : field_value}
                        data_dict['Activities'].update(datapoint)
                    elif field_name == 'weight':
                        datapoint = {field_name : field_value}
                        data_dict['Activities'].update(datapoint)
                    elif field_name == 'resting_heart_rate':
                        datapoint = {field_name : field_value}
                        data_dict['Activities'].update(datapoint)
        except Exception as error:
            print(error)

        # Read workout name

        try:
            datapoint.clear()
            for workout_step in messages['workout_mesgs']:
                for field_name in workout_step:
                    field_value = workout_step[field_name]
                    if field_name == 'wkt_name':
                        datapoint = {'workout_name' : field_value}
                
            data_dict['Activities'].update(datapoint)
        except Exception as error:
            print(error)
    
        
        res=jsonify(data_dict)
        res.status_code = 200
        return res    
    else:
        res = {}
        # res.status_code = 404
        return res

    
# GET an individual health record byid


@main_bp.route('/health')
def health():
    try:
        startdate = request.args.get('start')
        enddate = request.args.get('end')
        conn = exdb.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        sql = "SELECT * FROM health WHERE date BETWEEN %s and %s ORDER BY date"
        data = (startdate, enddate)
        cursor.execute(sql, data)
        health = cursor.fetchall()
        res = jsonify(health)
        res.status_code = 200

        return res
    except Exception as e:
        print(e)
    finally:
        cursor.close() 
        conn.close()

@main_bp.route('/health/<int:healthid>')
def readhealth(healthid):
    try:
        conn = exdb.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        sql = "SELECT * FROM health WHERE id=%s"
        cursor.execute(sql, healthid)
        health = cursor.fetchone()
        print(health)
        res = jsonify(health)
        res.status_code = 200

        return res
    except Exception as e:
        print(e)
    finally:
        cursor.close()
        conn.close()   
        
@main_bp.route('/stats')
def stats():
    try:
        startdate = request.args.get('start')
        enddate = request.args.get('end')
        conn = exdb.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        sql = "SELECT * FROM stats WHERE date BETWEEN %s and %s ORDER BY date"
        data = (startdate, enddate)
        cursor.execute(sql, data)
        health = cursor.fetchall()
        res = jsonify(health)
        res.status_code = 200

        return res
    except Exception as e:
        print(e)
    finally:
        cursor.close() 
        conn.close()


            
@main_bp.errorhandler(404)
def not_found(error=None):
    message = {
        'status': 404,
        'message': 'There is no record: ' + request.url,
    }
    res = jsonify(message)
    res.status_code = 404

    return res
        
if __name__ == "__main__":
    
    app.secret_key = 'super secret key'
    app.config['SESSION_TYPE'] = 'filesystem'

    #sess.init_app(app)

    app.debug = True
    
    app.run(host='0.0.0.0', port=5010)  

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS
