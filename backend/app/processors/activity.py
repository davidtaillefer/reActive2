from .laps import assign_records_to_laps
from .grades import compute_grades, smooth_grades, grade_stats

def finalize_activity(activity):
    assign_records_to_laps(activity.track, activity.laps)

    compute_grades(activity.track)
    smooth_grades(activity.track)

    activity.grade_min, activity.grade_max = grade_stats(activity.track)

    return activity