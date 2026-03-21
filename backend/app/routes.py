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
            #print(file)
            if file.filename == '':
                flash('No selected file')
                print('No selected file')
                return redirect(request.url)
            if file and allowed_file(file.filename):
                print('File allowed')
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
    
    UPLOAD_FOLDER = '/mnt/data/gps/fit'
    ALLOWED_EXTENSIONS = {'fit', 'tcx', 'gpx'}
    print('Request received for HRM upload')
    
    os.makedirs(UPLOAD_FOLDER, exist_ok=True)

    if 'file' not in request.files:
        return jsonify({'error': 'No file part in the request'}), 400    
    
    try:
        if request.method == 'POST':
            file = request.files['file']
            if file.filename == '':
                print('No selected file')
                return redirect(request.url)
            if file and allowed_file(file.filename, ALLOWED_EXTENSIONS):
                print('File allowed')
                filename = secure_filename(file.filename)
                file.save(os.path.join(UPLOAD_FOLDER, filename))
                return jsonify({
                    'res': 'HRM File Sucessfully Uploaded.',
                    'status': '200',
                    'filename': filename,
                    'msg': 'Success'
                })
            return jsonify({'error': 'File type not allowed'}), 400
        
    except Exception as e:
        return jsonify({'error': f'Server error: {str(e)}'}), 500

        
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

@main_bp.route('/health/last_known', methods=['GET'])
def get_last_known_weight():
    # Get the start date of your current window from the query params
    before_date = request.args.get('before') 
    
    # Query for the single most recent record before that date
    query = """
        SELECT weight /1000 as weight, date 
        FROM health 
        WHERE date < %s AND weight IS NOT NULL 
        ORDER BY date DESC 
        LIMIT 1
    """
    conn = exdb.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    cursor.execute(query, (before_date))
    result = cursor.fetchone()
    return jsonify(result)
    
    #if result:
    #    return jsonify({'weight': result[0], 'date': result[1]})
    #return jsonify({'weight': 82.7, 'date': None}) # Fallback baseline

        
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
        
# if __name__ == "__main__":
    
#     app.secret_key = 'super secret key'
#     app.config['SESSION_TYPE'] = 'filesystem'

#     #sess.init_app(app)

#     app.debug = True
    
#     app.run(host='0.0.0.0', port=5010)  

def allowed_file(filename, allowed_extensions):
    print('Checking if file is allowed')
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in allowed_extensions
