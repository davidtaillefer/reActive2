import datetime
import json
import logging
import os
import sys
from contextlib import suppress
from datetime import timedelta
from getpass import getpass
from pathlib import Path
from typing import Any
from .db import exdb
from flask import Blueprint, jsonify
from pymysql import Error
from datetime import timedelta, date

import requests
from garth.exc import GarthException, GarthHTTPError

from garminconnect import (
    Garmin,
    GarminConnectAuthenticationError,
    GarminConnectConnectionError,
    GarminConnectTooManyRequestsError,
)

sync_bp = Blueprint('sync', __name__)

@sync_bp.route('/sync')
def sync():
    api_instance = init_api(config.email, config.password)

    try:
        if api_instance:
            try:
                response = call_api(api_instance, config.today.isoformat())
            except Exception as e:
                print(
                    f"Unable to fetch stats for display: {e}"
                )  # Silently skip if stats can't be fetched
    except Exception as e:
        print(f"Unexpected error: {e}")
    return jsonify({
                    'res': 'Activity created successfully.',
                    'status': '200',
                    'msg': 'Success'
                })


@sync_bp.route('/sync/days/<int:days>')
def sync_days(days):
    api_instance = init_api(config.email, config.password)
    if not api_instance:
        return jsonify({'error': 'Failed to initialize API'}), 500

    results = []
    today = date.today()

    try:
        # Loop backwards from today for the specified number of days
        for i in range(days):
            target_date = today - timedelta(days=i)
            target_date_str = target_date.isoformat()
            
            print(f"Syncing data for: {target_date_str}")
            print(health_data)
            print(stats_data)
            
            try:
                # Reuse your existing call_api function
                # This should handle the "Insert on Duplicate Key Update" logic
                response = call_api(api_instance, target_date_str)
                results.append({"date": target_date_str, "status": "success"})
            except Exception as e:
                print(f"Error syncing {target_date_str}: {e}")
                results.append({"date": target_date_str, "status": "failed", "error": str(e)})

        return jsonify({
            'res': f'Sync completed for {days} days.',
            'details': results,
            'status': '200',
            'msg': 'Success'
        })

    except Exception as e:
        print(f"Unexpected error during multi-day sync: {e}")
        return jsonify({'error': str(e)}), 500


# Configure logging to reduce verbose error output from garminconnect library
# This prevents double error messages for known API issues
logging.getLogger("garminconnect").setLevel(logging.CRITICAL)

api: Garmin | None = None


class Config:
    """Configuration class for the Garmin Connect API demo."""

    def __init__(self):
        # Load environment variables
        self.email = os.getenv("EMAIL")
        self.password = os.getenv("PASSWORD")
        self.tokenstore = os.getenv("GARMINTOKENS") or "~/.garminconnect"
        self.tokenstore_base64 = (
            os.getenv("GARMINTOKENS_BASE64") or "~/.garminconnect_base64"
        )

        # Date settings
        self.today = datetime.date.today()
        self.yesterday = self.today - timedelta(days=1)
        self.week_start = self.today - timedelta(days=7)
        self.month_start = self.today - timedelta(days=30)

        # API call settings
        self.default_limit = 100
        self.start = 0
        self.start_badge = 1  # Badge related calls start counting at 1

        # Activity settings
        self.activitytype = ""  # Possible values: cycling, running, swimming, multi_sport, fitness_equipment, hiking, walking, other
        self.activityfile = "test_data/*.gpx"  # Supported file types: .fit .gpx .tcx
        self.workoutfile = "test_data/sample_workout.json"  # Sample workout JSON file

        # Export settings
        self.export_dir = Path("your_data")
        self.export_dir.mkdir(exist_ok=True)


# Initialize configuration
config = Config()

health_data = {
    "date": '',
    "weight": 0,
    "body_fat": 0,
    "muscle": 0,
    "bone": 0,
    "body_water": 0,
    "bmi": 0,
    "min_hr": 0,
    "max_hr": 0,
    "resting_hr": 0,
    "avg_SPO2": 0,
    "min_SPO2": 0,
}

stats_data = {
    "date": '',
    "moderate_intensity": 0,
    "vigorous_intensity": 0,
    "intensity_goal": 0,
    "training_status": 0,
    "running_vo2_max": 0,
    "cycling_vo2_max": 0,
    "total_steps": 0,
    "daily_step_goal": 0,
    "floors_ascended": 0,
    "floors_descended": 0,
    "floor_goal": 0,
    "training_status": 0
}

def get_mfa() -> str:
    """Get MFA token."""
    return input("MFA one-time code: ")


# Call Garmin API and procees incoming data

def call_api(api, date):

    try:
        stats = api.get_stats_and_body(date)
        training = api.get_training_status(date)

        if stats:
            health_data["date"] = stats.get("calendarDate")
            health_data["min_hr"] = stats.get("minHeartRate")
            health_data["max_hr"] = stats.get("maxHeartRate")
            health_data["resting_hr"] = stats.get("restingHeartRate")
            health_data["weight"] = stats.get("weight")
            health_data["bmi"] = stats.get("bmi")
            health_data["body_fat"] = stats.get("bodyFat")
            health_data["body_water"] = stats.get("bodyWater")
            health_data["bone"] = stats.get("boneMass")
            health_data["muscle"] = stats.get("muscleMass")
            health_data["avg_SPO2"] = stats.get("averageSpo2")
            health_data["min_SPO2"] = stats.get("lowestSpo2")

            stats_data["date"] = date
            stats_data["moderate_intensity"] = stats.get("moderateIntensityMinutes")
            stats_data["vigorous_intensity"] = stats.get("vigorousIntensityMinutes")

            stats_data["intensity_goal"] = stats.get("intensityMinutesGoal")

            stats_data["total_steps"] = stats.get("totalSteps")
            stats_data["daily_step_goal"] = stats.get("dailyStepGoal")

            stats_data["floors_ascended"] = stats.get("floorsAscended")
            stats_data["floors_descended"] = stats.get("floorsDescended")
            stats_data["floor_goal"] = stats.get("userFloorsAscendedGoal")

            stats_data["running_vo2_max"] = training.get("mostRecentVO2Max", {}).get("generic", {}).get("vo2MaxPreciseValue", "Not Found")
            stats_data["cycling_vo2_max"] = training.get("mostRecentVO2Max", {}).get("cycling", {}).get("vo2MaxPreciseValue", "Not Found")
        
            level_3 = training.get("mostRecentTrainingStatus", {}).get("latestTrainingStatusData", {})
            target_obj = next(iter(level_3.values()), {})
            stats_data["training_status"] = target_obj.get("trainingStatus")


            formatted_output = json.dumps(target_obj, indent=2, default=str)
            #formatted_output = json.dumps(training, indent=2, default=str)
            #print(formatted_output)

            try:
                sqlQuery = """
                    INSERT INTO health (
                        date, weight, body_fat, muscle, bone, body_water, bmi, 
                        min_HR, max_HR, resting_HR, avg_SPO2, min_SPO2
                    ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                    ON DUPLICATE KEY UPDATE 
                        weight = VALUES(weight), 
                        body_fat = VALUES(body_fat),
                        muscle = VALUES(muscle),
                        bone = VALUES(bone),
                        body_water = VALUES(body_water),
                        bmi = VALUES(bmi),
                        min_HR = VALUES(min_HR),
                        max_HR = VALUES(max_HR),
                        resting_HR = VALUES(resting_HR),
                        avg_SPO2 = VALUES(avg_SPO2),
                        min_SPO2 = VALUES(min_SPO2)
                """

                data = (
                    health_data["date"], 
                    health_data.get("weight"), 
                    health_data.get("body_fat"), 
                    health_data.get("muscle"), 
                    health_data.get("bone"), 
                    health_data.get("body_water"), 
                    health_data.get("bmi"), 
                    health_data.get("min_hr"), 
                    health_data.get("max_hr"), 
                    health_data.get("resting_hr"), 
                    health_data.get("avg_SPO2"), 
                    health_data.get("min_SPO2")
                )

                conn = exdb.connect()
                cursor = conn.cursor() 
                cursor.execute(sqlQuery, data)
                conn.commit()
                print("Health record saved successfully!")

            except Exception as e:
                print(f"DATABASE ERROR: {e}")
                return {"error": str(e)}, 400 
            finally:
                if 'conn' in locals():
                    conn.close()
            try:
                sqlQuery = """
                    INSERT INTO stats (
                        date, moderate_intensity, vigorous_intensity, intensity_goal, training_status, running_vo2_max, cycling_vo2_max, 
                        total_steps, daily_step_goal, floors_ascended, floors_descended, floor_goal
                    ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                    ON DUPLICATE KEY UPDATE 
                        moderate_intensity = VALUES(moderate_intensity), 
                        vigorous_intensity = VALUES(vigorous_intensity),
                        intensity_goal = VALUES(intensity_goal),
                        training_status = VALUES(training_status),
                        running_vo2_max = VALUES(running_vo2_max),
                        cycling_vo2_max = VALUES(cycling_vo2_max),
                        total_steps = VALUES(total_steps),
                        daily_step_goal = VALUES(daily_step_goal),
                        floors_ascended = VALUES(floors_ascended),
                        floors_descended = VALUES(floors_descended),
                        floor_goal = VALUES(floor_goal)
                """

                data = (
                    stats_data["date"], 
                    stats_data.get("moderate_intensity"), 
                    stats_data.get("vigorous_intensity"), 
                    stats_data.get("intensity_goal"), 
                    stats_data.get("training_status"), 
                    stats_data.get("running_vo2_max"), 
                    stats_data.get("cycling_vo2_max"), 
                    stats_data.get("total_steps"), 
                    stats_data.get("daily_step_goal"), 
                    stats_data.get("floors_ascended"), 
                    stats_data.get("floors_descended"), 
                    stats_data.get("floor_goal")
                )

                conn = exdb.connect()
                cursor = conn.cursor() 
                cursor.execute(sqlQuery, data)
                conn.commit()
                print("Stats record saved successfully!")

            except Exception as e:
                print(f"DATABASE ERROR: {e}")
                return {"error": str(e)}, 400 
            finally:
                if 'conn' in locals():
                    conn.close()
        return True

    except GarthHTTPError as e:
        # Handle specific HTTP errors more gracefully
        error_str = str(e)

        # Extract status code more reliably
        status_code = None
        if hasattr(e, "response") and hasattr(e.response, "status_code"):
            status_code = e.response.status_code

        # Handle specific status codes
        if status_code == 400 or ("400" in error_str and "Bad Request" in error_str):
            error_msg = "Endpoint not available (400 Bad Request) - This feature may not be enabled for your account or region"
            # Don't print for 400 errors as they're often expected for unavailable features
        elif status_code == 401 or "401" in error_str:
            error_msg = (
                "Authentication required (401 Unauthorized) - Please re-authenticate"
            )
            print(f"⚠️ failed: {error_msg}")
        elif status_code == 403 or "403" in error_str:
            error_msg = "Access denied (403 Forbidden) - Your account may not have permission for this feature"
            print(f"⚠️ failed: {error_msg}")
        elif status_code == 404 or "404" in error_str:
            error_msg = (
                "Endpoint not found (404) - This feature may have been moved or removed"
            )
            print(f"⚠️ failed: {error_msg}")
        elif status_code == 429 or "429" in error_str:
            error_msg = (
                "Rate limit exceeded (429) - Please wait before making more requests"
            )
            print(f"⚠️ failed: {error_msg}")
        elif status_code == 500 or "500" in error_str:
            error_msg = "Server error (500) - Garmin's servers are experiencing issues"
            print(f"⚠️ failed: {error_msg}")
        elif status_code == 503 or "503" in error_str:
            error_msg = "Service unavailable (503) - Garmin's servers are temporarily unavailable"
            print(f"⚠️ failed: {error_msg}")
        else:
            error_msg = f"HTTP error: {e}"

        print(f"⚠️ failed: {error_msg}")
        return False, error_msg

    except GarminConnectAuthenticationError as e:
        error_msg = f"Authentication issue: {e}"
        print(f"⚠️ failed: {error_msg}")
        return False, error_msg

    except GarminConnectConnectionError as e:
        error_msg = f"Connection issue: {e}"
        print(f"⚠️ failed: {error_msg}")
        return False, error_msg

    except Exception as e:
        error_msg = f"Unexpected error: {e}"
        print(f"⚠️ failed: {error_msg}")
        return False, error_msg



def format_timedelta(td):
    minutes, seconds = divmod(td.seconds + td.days * 86400, 60)
    hours, minutes = divmod(minutes, 60)
    return f"{hours:d}:{minutes:02d}:{seconds:02d}"


def download_activities_by_date(api: Garmin) -> None:
    """Download activities by date range in multiple formats."""
    try:
        print(
            f"📥 Downloading activities by date range ({config.week_start.isoformat()} to {config.today.isoformat()})..."
        )

        # Get activities for the date range (last 7 days as default)
        activities = api.get_activities_by_date(
            config.week_start.isoformat(), config.today.isoformat()
        )

        if not activities:
            print("ℹ️ No activities found in the specified date range")
            return

        print(f"📊 Found {len(activities)} activities to download")

        # Download each activity in multiple formats
        for activity in activities:
            activity_id = activity.get("activityId")
            activity_name = activity.get("activityName", "Unknown")
            start_time = activity.get("startTimeLocal", "").replace(":", "-")

            if not activity_id:
                continue

            print(f"📥 Downloading: {activity_name} (ID: {activity_id})")

            # Download formats: GPX, TCX, ORIGINAL, CSV
            formats = ["GPX", "TCX", "ORIGINAL", "CSV"]

            for fmt in formats:
                try:
                    filename = f"{start_time}_{activity_id}_ACTIVITY.{fmt.lower()}"
                    if fmt == "ORIGINAL":
                        filename = f"{start_time}_{activity_id}_ACTIVITY.zip"

                    filepath = config.export_dir / filename

                    if fmt == "CSV":
                        # Get activity details for CSV export
                        activity_details = api.get_activity_details(activity_id)
                        with open(filepath, "w", encoding="utf-8") as f:
                            import json

                            json.dump(activity_details, f, indent=2, ensure_ascii=False)
                        print(f"  ✅ {fmt}: {filename}")
                    else:
                        # Download the file from Garmin using proper enum values
                        format_mapping = {
                            "GPX": api.ActivityDownloadFormat.GPX,
                            "TCX": api.ActivityDownloadFormat.TCX,
                            "ORIGINAL": api.ActivityDownloadFormat.ORIGINAL,
                        }

                        dl_fmt = format_mapping[fmt]
                        content = api.download_activity(activity_id, dl_fmt=dl_fmt)

                        if content:
                            with open(filepath, "wb") as f:
                                f.write(content)
                            print(f"  ✅ {fmt}: {filename}")
                        else:
                            print(f"  ❌ {fmt}: No content available")

                except Exception as e:
                    print(f"  ❌ {fmt}: Error downloading - {e}")

        print(f"✅ Activity downloads completed! Files saved to: {config.export_dir}")

    except Exception as e:
        print(f"❌ Error downloading activities: {e}")


def remove_stored_tokens():
    """Remove stored login tokens."""
    try:
        import os
        import shutil

        token_path = os.path.expanduser(config.tokenstore)
        if os.path.isdir(token_path):
            shutil.rmtree(token_path)
            print("✅ Stored login tokens directory removed")
        else:
            print("ℹ️ No stored login tokens found")
    except Exception as e:
        print(f"❌ Error removing stored login tokens: {e}")


def disconnect_api(api: Garmin):
    """Disconnect from Garmin Connect."""
    api.logout()
    print("✅ Disconnected from Garmin Connect")


def init_api(email: str | None = None, password: str | None = None) -> Garmin | None:
    """Initialize Garmin API with smart error handling and recovery."""
    # First try to login with stored tokens
    try:
        print(f"Attempting to login using stored tokens from: {config.tokenstore}")

        garmin = Garmin()
        garmin.login(config.tokenstore)
        print("Successfully logged in using stored tokens!")
        return garmin

    except (
        FileNotFoundError,
        GarthHTTPError,
        GarminConnectAuthenticationError,
        GarminConnectConnectionError,
    ):
        print("No valid tokens found. Requesting fresh login credentials.")

    # Loop for credential entry with retry on auth failure
    while True:
        try:
            # Get credentials if not provided
            if not email or not password:
                email = input("Email address: ").strip()
                password = getpass("Password: ")

            print("Logging in with credentials...")
            garmin = Garmin(
                email=email, password=password, is_cn=False, return_on_mfa=True
            )
            result1, result2 = garmin.login()

            if result1 == "needs_mfa":
                print("Multi-factor authentication required")

                mfa_code = get_mfa()
                print("🔄 Submitting MFA code...")

                try:
                    garmin.resume_login(result2, mfa_code)
                    print("✅ MFA authentication successful!")

                except GarthHTTPError as garth_error:
                    # Handle specific HTTP errors from MFA
                    error_str = str(garth_error)
                    print(f"🔍 Debug: MFA error details: {error_str}")

                    if "429" in error_str and "Too Many Requests" in error_str:
                        print("❌ Too many MFA attempts")
                        print("💡 Please wait 30 minutes before trying again")
                        sys.exit(1)
                    elif "401" in error_str or "403" in error_str:
                        print("❌ Invalid MFA code")
                        print("💡 Please verify your MFA code and try again")
                        continue
                    else:
                        # Other HTTP errors - don't retry
                        print(f"❌ MFA authentication failed: {garth_error}")
                        sys.exit(1)

                except GarthException as garth_error:
                    print(f"❌ MFA authentication failed: {garth_error}")
                    print("💡 Please verify your MFA code and try again")
                    continue

            # Save tokens for future use
            garmin.garth.dump(config.tokenstore)
            print(f"Login successful! Tokens saved to: {config.tokenstore}")

            return garmin

        except GarminConnectAuthenticationError:
            print("❌ Authentication failed:")
            print("💡 Please check your username and password and try again")
            # Clear the provided credentials to force re-entry
            email = None
            password = None
            continue

        except (
            FileNotFoundError,
            GarthHTTPError,
            GarthException,
            GarminConnectConnectionError,
            requests.exceptions.HTTPError,
        ) as err:
            print(f"❌ Connection error: {err}")
            print("💡 Please check your internet connection and try again")
            return None

        except KeyboardInterrupt:
            print("\nLogin cancelled by user")
            return None


# def main():
    
#     api_instance = init_api(config.email, config.password)

#     try:
#         if api_instance:
#             try:
#                 summary = api_instance.get_user_summary(config.today.isoformat())
#                 success, error = call_api(api_instance, config.today.isoformat())
                
#                 steps = summary.get("totalSteps") or 0
#                 calories = summary.get("totalKilocalories") or 0

#                 # Build stats string with hydration if available
#                 stats_parts = [f"{steps:,} steps", f"{calories} kcal"]

#                 stats_string = " | ".join(stats_parts)
#                 print(f"\n📊 Your Stats Today: {stats_string}")

#                 if steps < 5000:
#                     print("🐌 Time to get those legs moving!")
#                 elif steps > 7500:
#                     print("🏃‍♂️ You're crushing it today!")
#                 else:
#                     print("👍 Nice progress! Keep it up!")
#                 #formatted_output = json.dumps(summary, indent=2, default=str)
#                 #print(formatted_output)
#                 #formatted_output = json.dumps(training, indent=2, default=str)
#                 #print(formatted_output)
#                 print(health_data)
#                 print(stats_data)


#             except Exception as e:
#                 print(
#                     f"Unable to fetch stats for display: {e}"
#                 )  # Silently skip if stats can't be fetched

        
#     except Exception as e:
#         print(f"Unexpected error: {e}")


# if __name__ == "__main__":
#     main()
