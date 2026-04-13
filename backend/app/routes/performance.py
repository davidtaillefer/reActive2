from flask import Blueprint, jsonify
from ..utils.user_utils import get_user_uuid
from ..services.performance_service import get_performance_summary

performance_bp = Blueprint("performance", __name__)


@performance_bp.route("/performance", methods=['GET'])
def performance():
    user_id = get_user_uuid()

    data = get_performance_summary(user_id)

    return jsonify(data)