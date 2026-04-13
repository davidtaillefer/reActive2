import uuid
from flask import request

def get_user_uuid():
    user_uuid = request.headers.get("X-User-Id")
    if not user_uuid:
        user_uuid = str(uuid.uuid4())
    return 1000