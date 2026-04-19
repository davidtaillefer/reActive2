import pytest
import sys
import os

# Ensure project root is on sys.path so we can import lib.metrics_availability
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from lib.metrics_availability import compute_metrics_availability


def make_point(**kwargs):
    p = {}
    p.update(kwargs)
    return p


def test_empty_track_no_muscles():
    track = []
    out = compute_metrics_availability(track, None)
    assert out == {
        "heartRate": False,
        "power": False,
        "cadence": False,
        "speed": False,
        "elevation": False,
        "distance": False,
        "position": False,
        "muscles": False,
    }


def test_track_with_values_and_muscles():
    track = [
        make_point(heart_rate=120, enhanced_speed=3.5, enhanced_altitude=50, distance=100, position_lat=45.0, position_long=-122.0),
        make_point(heart_rate=None, enhanced_speed=None, enhanced_altitude=None, distance=None, position_lat=None, position_long=None),
    ]
    muscles = {"chest": 10}
    out = compute_metrics_availability(track, muscles)
    assert out["heartRate"] is True
    assert out["speed"] is True
    assert out["elevation"] is True
    assert out["distance"] is True
    assert out["position"] is True
    assert out["muscles"] is True
    assert out["power"] is False
    assert out["cadence"] is False


def test_position_missing_one_coordinate():
    track = [
        make_point(position_lat=45.0, position_long=None),
        make_point(position_lat=None, position_long=-122.0),
    ]
    out = compute_metrics_availability(track, None)
    # position requires both coords on the same point
    assert out["position"] is False


def test_numeric_threshold_zero_not_counted():
    track = [make_point(heart_rate=0), make_point(heart_rate=None)]
    out = compute_metrics_availability(track, None)
    assert out["heartRate"] is False
