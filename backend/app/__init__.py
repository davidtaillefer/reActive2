from flask import Flask
from flask_cors import CORS
from .db import exdb

def create_app():
    app = Flask(__name__)
    app.config.from_object('config.Config')

    CORS(app)
    exdb.init_app(app)

    # Import the Blueprint from routes.py and register it
    from .routes import main_bp, activities_bp, hrm_bp, sync_bp
    from .hrmbak import hrm_bpbak
    from .routes.preferences import preferences_bp
    app.register_blueprint(main_bp)
    app.register_blueprint(activities_bp)
    app.register_blueprint(hrm_bp)
    app.register_blueprint(hrm_bpbak)
    app.register_blueprint(sync_bp)
    app.register_blueprint(preferences_bp)
    return app
