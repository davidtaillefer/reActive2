from flask import Blueprint, request, jsonify
from ..utils.user_utils import get_user_uuid
from app.services.preferences_service import get_preferences, save_preferences
from app import db  # your DB connection

preferences_bp = Blueprint("preferences", __name__)

@preferences_bp.route("/preferences", methods=["GET"])
def fetch_preferences():
    user_uuid = get_user_uuid()
    uuid = 1000
    print(f"Fetching preferences for user_uuid: {user_uuid}")
    prefs = get_preferences(db, user_uuid)

    return jsonify({
        "user_uuid": user_uuid,
        "preferences": prefs
    })


@preferences_bp.route("/preferences", methods=["POST"])
def update_preferences():
    user_uuid = get_user_uuid()
    data = request.json or {}

    save_preferences(db, user_uuid, data)

    return {"status": "ok"}