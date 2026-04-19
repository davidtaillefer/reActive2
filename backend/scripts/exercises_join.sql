-- =========================
-- INSERT CATEGORIES
-- =========================

INSERT INTO exercise_categories (name)
SELECT 'banded_exercises'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'banded_exercises'
);

INSERT INTO exercise_categories (name)
SELECT 'battle_rope'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'battle_rope'
);

INSERT INTO exercise_categories (name)
SELECT 'bench_press'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'bench_press'
);

INSERT INTO exercise_categories (name)
SELECT 'bike'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'bike'
);

INSERT INTO exercise_categories (name)
SELECT 'bike_outdoor'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'bike_outdoor'
);

INSERT INTO exercise_categories (name)
SELECT 'calf_raise'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'calf_raise'
);

INSERT INTO exercise_categories (name)
SELECT 'cardio'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'cardio'
);

INSERT INTO exercise_categories (name)
SELECT 'carry'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'carry'
);

INSERT INTO exercise_categories (name)
SELECT 'chop'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'chop'
);

INSERT INTO exercise_categories (name)
SELECT 'core'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'core'
);

INSERT INTO exercise_categories (name)
SELECT 'crunch'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'crunch'
);

INSERT INTO exercise_categories (name)
SELECT 'curl'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'curl'
);

INSERT INTO exercise_categories (name)
SELECT 'deadlift'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'deadlift'
);

INSERT INTO exercise_categories (name)
SELECT 'elliptical'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'elliptical'
);

INSERT INTO exercise_categories (name)
SELECT 'floor_climb'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'floor_climb'
);

INSERT INTO exercise_categories (name)
SELECT 'flye'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'flye'
);

INSERT INTO exercise_categories (name)
SELECT 'hip_raise'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'hip_raise'
);

INSERT INTO exercise_categories (name)
SELECT 'hip_stability'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'hip_stability'
);

INSERT INTO exercise_categories (name)
SELECT 'hip_swing'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'hip_swing'
);

INSERT INTO exercise_categories (name)
SELECT 'hyperextension'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'hyperextension'
);

INSERT INTO exercise_categories (name)
SELECT 'indoor_bike'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'indoor_bike'
);

INSERT INTO exercise_categories (name)
SELECT 'indoor_row'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'indoor_row'
);

INSERT INTO exercise_categories (name)
SELECT 'ladder'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'ladder'
);

INSERT INTO exercise_categories (name)
SELECT 'lateral_raise'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'lateral_raise'
);

INSERT INTO exercise_categories (name)
SELECT 'leg_curl'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'leg_curl'
);

INSERT INTO exercise_categories (name)
SELECT 'leg_raise'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'leg_raise'
);

INSERT INTO exercise_categories (name)
SELECT 'lunge'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'lunge'
);

INSERT INTO exercise_categories (name)
SELECT 'move'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'move'
);

INSERT INTO exercise_categories (name)
SELECT 'olympic_lift'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'olympic_lift'
);

INSERT INTO exercise_categories (name)
SELECT 'plank'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'plank'
);

INSERT INTO exercise_categories (name)
SELECT 'plyo'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'plyo'
);

INSERT INTO exercise_categories (name)
SELECT 'pose'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'pose'
);

INSERT INTO exercise_categories (name)
SELECT 'pull_up'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'pull_up'
);

INSERT INTO exercise_categories (name)
SELECT 'push_up'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'push_up'
);

INSERT INTO exercise_categories (name)
SELECT 'row'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'row'
);

INSERT INTO exercise_categories (name)
SELECT 'run'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'run'
);

INSERT INTO exercise_categories (name)
SELECT 'run_indoor'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'run_indoor'
);

INSERT INTO exercise_categories (name)
SELECT 'sandbag'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'sandbag'
);

INSERT INTO exercise_categories (name)
SELECT 'shoulder_press'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'shoulder_press'
);

INSERT INTO exercise_categories (name)
SELECT 'shoulder_stability'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'shoulder_stability'
);

INSERT INTO exercise_categories (name)
SELECT 'shrug'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'shrug'
);

INSERT INTO exercise_categories (name)
SELECT 'sit_up'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'sit_up'
);

INSERT INTO exercise_categories (name)
SELECT 'sled'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'sled'
);

INSERT INTO exercise_categories (name)
SELECT 'sledge_hammer'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'sledge_hammer'
);

INSERT INTO exercise_categories (name)
SELECT 'squat'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'squat'
);

INSERT INTO exercise_categories (name)
SELECT 'stair_stepper'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'stair_stepper'
);

INSERT INTO exercise_categories (name)
SELECT 'suspension'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'suspension'
);

INSERT INTO exercise_categories (name)
SELECT 'tire'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'tire'
);

INSERT INTO exercise_categories (name)
SELECT 'total_body'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'total_body'
);

INSERT INTO exercise_categories (name)
SELECT 'triceps_extension'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'triceps_extension'
);

INSERT INTO exercise_categories (name)
SELECT 'warm_up'
WHERE NOT EXISTS (
    SELECT 1 FROM exercise_categories WHERE name = 'warm_up'
);


-- =========================
-- INSERT EXERCISES (JOINED)
-- =========================

INSERT INTO exercises (name, category_id)
SELECT 'weighted_wide_stance_plank_with_diagonal_leg_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'eagle', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'inching_elbow_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cable_rotational_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'chop'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lying_reverse_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'shotshell', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_alternating_hands_medicine_ball_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'forward_bend_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_front_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_lunge_sweep', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_fire_hydrant_kicks', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_swiss_ball_side_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_side_lunge_jump_off', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_reverse_sliding_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_single_leg_flex_and_extend', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'punch_down_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_forearms', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'plank_with_feet_on_swiss_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'arm_circles', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'poor', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'double_punch_forward_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'plank_up_downs', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'power_squat_chops', ec.id
FROM exercise_categories ec
WHERE ec.name = 'chop'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'balancing_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'threat_approaching', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'salt', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_lateral_slide', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'half_roll_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_lateral_plyo_squats', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'jumping_pull_ups', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'slide_out', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_stretch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bicycle_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_crossover_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'interval_cooldown', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kettlebell_sit_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'overhead_walk', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_single_arm_overhead_dumbbell_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'approaching_first_deco_stop', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_triple_under', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_floor_inverted_shoulder_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'chest_fly_incline_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_ring_l_sit', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'staggered_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'preacher_curl_with_cable', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_single_leg_back_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cardio_core_crawl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alternating_jump_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_knee_raises', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'sumo_deadlift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'deadlift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'arch_and_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'straight_leg_crunch_with_leg_lift_with_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'assault_bike', ec.id
FROM exercise_categories ec
WHERE ec.name = 'indoor_bike'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'sitting_russian_twist', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'siff_jump_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_arm_neutral_grip_dumbbell_row_and_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'sumo_squat_slide_in', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kettlebell_biceps_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'squats_with_band', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'one_arm_cable_lateral_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lying_external_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_flex_and_extend', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_flye', ec.id
FROM exercise_categories ec
WHERE ec.name = 'flye'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lying_triceps_extension_to_close_grip_bench_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'high_box_jump', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'elliptical', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kneeling_side_plank_with_leg_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_split', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'forward_and_backward_leg_swings', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'marching_in_place', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_bicycle_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lying_abduction_stretch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'wide_grip_pull_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hex_dumbbell_hold', ec.id
FROM exercise_categories ec
WHERE ec.name = 'carry'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'skater_crunch_cross', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'punch_sideways_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hug_a_tree_with_ball_band_and_weight', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lizard', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'setpoint_switch_auto_low', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'close_hands_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_crescent_circle', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_suspended_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_toes_to_bar', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'half_kneeling_rotational_chop', ec.id
FROM exercise_categories ec
WHERE ec.name = 'chop'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_cable_hip_abduction', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hip_raise_with_feet_on_swiss_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'wide_stance_barbell_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_ring_handstand_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_incline_y_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kneeling_rotational_reverse_chop', ec.id
FROM exercise_categories ec
WHERE ec.name = 'chop'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_hip_raise_with_head_on_swiss_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_upright_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shrug'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'tricep_kickback', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'one_arm_concentration_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kneeling_superman', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'curtsy_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alert_dismissed_by_key', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_high_pull', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_push_up_with_feet_on_swiss_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'scissors', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dolphin_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'triangle_hip_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_elevated_single_leg_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'deadlift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'military_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_chop', ec.id
FROM exercise_categories ec
WHERE ec.name = 'chop'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT '3_way_weighted_single_leg_calf_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'calf_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_plank_and_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_lying_straight_leg_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lat_pullover', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'breathing_punches_overhead_and_down_side_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'interval_other', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'burpee_box_jump', ec.id
FROM exercise_categories ec
WHERE ec.name = 'total_body'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'toes_to_elbows', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alternating_squat_wave', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'leg_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_cross_chop_to_knee', ec.id
FROM exercise_categories ec
WHERE ec.name = 'chop'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kettlebell_windmill', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'one_arm_preacher_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_barbell_rollout', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'overhead_dumbbell_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'overhead_barbell_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'clapping_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'climb_active', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'extended_side_angle', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'rifle_cartridge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'setpoint_switch_auto_high', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'knee_circles', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'close_grip_medicine_ball_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'shrug_arm_down_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shrug'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'foam_roller_reverse_crunch_with_medicine_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'rainbow', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'other', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_lying_it_band', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'calorie_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_easy_side_bend', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'towel_pull_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kipping_pull_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'arm_extend_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_standing_it_band', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'opposite_arm_and_leg_balance', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stage_coach', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'wide_grip_barbell_deadlift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'deadlift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'decline_dumbbell_flye', ec.id
FROM exercise_categories ec
WHERE ec.name = 'flye'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_arm_deadlift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'deadlift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_mixed_grip_chin_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'trx_inverted_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_spiderman_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_floor_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bench_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_ez_bar_overhead_triceps_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'three_way_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_deadlift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'deadlift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_barbell_overhead_triceps_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'switched_to_open_circuit', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_pistol_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'windmill_switches', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bob_and_weave_circle', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'always_on', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_ez_bar_preacher_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'approaching_ndl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'crossover_chin_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cross_body_dumbbell_hammer_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_jump_rope_jog', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_medicine_ball_mountain_climber', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_swiss_ball_hip_raise_and_leg_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'speed_walk', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_abs_leg_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'criss_cross', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_ski_moguls', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'jump_rope', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kneeling_cross_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'external_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'plank_with_leg_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'wall_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_barbell_good_morning', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bench_squat_with_rotational_chop', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_squat_thrusts', ec.id
FROM exercise_categories ec
WHERE ec.name = 'total_body'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'band_good_morning', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_arms_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_bench_get_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'farmers_carry_on_toes', ec.id
FROM exercise_categories ec
WHERE ec.name = 'carry'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'time_alert', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_box_step_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_front_split', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'triceps_stretch_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lawnmower_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'pilates_plie_squats_parallel_turned_out_flat_and_heels', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_lying_spinal_twist', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'clean_and_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_wrist_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'leg_lowering_drill', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'v_grip_cable_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'squat_jump_onto_box', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'straight_leg_crunch_with_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lower_lift_on_disc', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lateral_stepover', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'safety_stop_started', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'sliding_hip_adduction', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'split_jack', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'assioma_uno', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'upper_back_stretch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_decline_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_lying_triceps_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'medicine_ball_v_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_obliques', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'otu_critical', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_swiss_ball_reverse_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'straight_leg_crunch_with_legs_crossed', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'footwork_on_disc', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_open_knee_tucks', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_shoulder_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_side_bend', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_overhead_squat_single_arm', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_kneeling_side_plank_with_leg_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'air_rifle_pellet', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_squat_jumps_in_and_out', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'farmers_carry', ec.id
FROM exercise_categories ec
WHERE ec.name = 'carry'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'one_arm_floor_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bench_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'warrior_three', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'judo_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ankle_circles', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'strict_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_quadruped_leg_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_swiss_ball_russian_twist', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'warm_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'double_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_hammer_curl_to_lunge_to_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kettlebell_swing_overhead', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'sprint', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_split_rotational_reverse_chop', ec.id
FROM exercise_categories ec
WHERE ec.name = 'chop'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_bulgarian_split_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'gas_switch_prompted', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ultimate_warrior', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'boat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ride', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bike'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'periodic', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reclining_triceps_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'back_massage', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'offset_dumbbell_reverse_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'deco_stop_cleared', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'medicine_ball_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_swiss_ball_side_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'muscle_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'foam_roller_reverse_crunch_on_bench', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'suspended_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'foot_rolling', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'walking_barbell_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_abs', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'custom', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alternating_dumbbell_biceps_curl_on_swiss_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'glute_bridge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'tank_battery_low', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_pull_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT '90_degree_cable_external_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_single_leg_hip_raise_with_foot_on_medicine_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_runners_lunge_to_balance', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'head_to_knee', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_hand_release_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_butterfly', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'po2_crit_low', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'overhead_curl_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'pike', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_swiss_ball_y_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_ez_bar_lying_triceps_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kneeling_ab_wheel', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'drag_curl_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_static_back_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bridge_one_leg_bridge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_sliding_hip_adduction', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'knee_folds_on_disc', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_flutter_kicks', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sandbag'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'front_kick_tabletop', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'burpee_box_jump_over', ec.id
FROM exercise_categories ec
WHERE ec.name = 'total_body'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'pole_handcycle_backward_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'elbow_plank_pike_jacks', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_hip_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'split_stance_hammer_curl_to_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_front_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alternating_jump_wave', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'double_leg_stretch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_wide_leg_forward_bend_with_twist', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_swiss_ball_hyperextension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'extended_puppy', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hip_crossover', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'outside_circle', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'pole_double_arm_overhead_and_forward_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alternating_sit_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_swiss_ball_opposite_arm_and_leg_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_plank_with_knee_tuck', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'isometric_explosive_body_weight_jump_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'punch_bag_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bicycle_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'clean', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sandbag'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_grip_barbell_bench_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bench_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_skater_crunch_cross', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'mermaid', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_side_to_side_crunch_and_weave', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_incline_dip', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'arm_circles_mid_backward_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stand_and_hang', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bridge_with_glute_lower_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_incline_reverse_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_plank_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'devotional_warrior', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_seated_alternating_reverse_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'get_up_sit_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_one_arm_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bridge_with_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'knee_folds', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_side_bend', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_hip_crossover', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'rem', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'plie_slides', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'zercher_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_calf', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'overhead_prayer_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'incline_rear_leg_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'one_arm_burpee', ec.id
FROM exercise_categories ec
WHERE ec.name = 'total_body'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lunge_with_diagonal_reach', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'squat_jumps_in_n_out', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'triple_stop_barbell_bench_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bench_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_sliding_leg_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_single_leg_deadlift_to_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'deadlift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_plank_with_feet_on_bench', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'setpoint_switch_manual_high', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'shoulder_stand', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'staff', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'time', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'toe_touch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_shrug', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shrug'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'spine_rotation_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bowed_half_moon', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_side_abs_leg_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hanging_l_sit', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standard', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'sit_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'plank_knee_pulls', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'easy_seated', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'russian_twist_on_swiss_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cable_pull_through', ec.id
FROM exercise_categories ec
WHERE ec.name = 'chop'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'revolved_half_moon', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_single_leg_hip_raise_with_foot_on_bench', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kneeling_rear_flye', ec.id
FROM exercise_categories ec
WHERE ec.name = 'flye'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ring_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_rope_climb', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_straight_leg_deadlift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'deadlift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alternating_dumbbell_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_isometric_explosive_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_rollout', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ndl_reached', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_hindu_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'punch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'pull_apart', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'box_step_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_hang_pull', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'deep_breathing_low_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'apnea_surface', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_wall_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_split_jerk', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_floor_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bench_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'wall_slide', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'thoracic_crunches_on_foam_roller', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_single_arm_medicine_ball_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'flutter_kicks', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'elevator_abs', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'walking_high_kicks', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_alternating_shoulder_press_and_twist', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_cobra', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'apnea_target_depth', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'diamond_leg_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_stretch_with_weights', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_shoulder', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_burpee_pull_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'medicine_ball_wood_chops', ec.id
FROM exercise_categories ec
WHERE ec.name = 'chop'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_swiss_ball_jackknife', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_alternating_sit_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'straight_arm_plank_with_shoulder_touch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'inner_thigh_circles', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_plank_with_knee_to_elbow', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_half_kneeling_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'chop'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_curl_to_overhead_press_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ghd_back_extensions', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'wide_side_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_base_rotations', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'box_jump', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swan', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_bosu_ball_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'low_lunge_twist', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'shoulder_rolls', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ab_twist', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_plank_with_elbow_on_bosu_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_balancing_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lunges_with_knee_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'rope_pressdown', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_cat_cow', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_plie_slides', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_squat_snatch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_side_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'modified_pilates_roll_up_with_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'speed', ec.id
FROM exercise_categories ec
WHERE ec.name = 'ladder'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_extended_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reclined_hand_to_foot', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_board_bench_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bench_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'prone_hip_internal_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_to_side_crunch_and_weave', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'overhead_dumbbell_shrug', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shrug'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'pole_straight_arm_overhead_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'pistol_cartridge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_burpee', ec.id
FROM exercise_categories ec
WHERE ec.name = 'total_body'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_towel_grip_inverted_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_jump_shrug', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shrug'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'pull_apart_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'rwd_walk', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_side_plank_with_knee_tuck', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'down_dog_split', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'around_the_world', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sandbag'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_lateral_step_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_cycling_russian_twist', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'behind_the_back_one_arm_cable_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_hang_power_clean', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_floor_i_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_side_lunge_sweep', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bear_crawl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_arm_dumbbell_snatch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_elbow_to_knee_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hanging_single_leg_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_childs_pose', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_back_squats', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'overhead_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_v_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_jump_rope', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'volume_sac', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'medicine_ball_overhead_throws', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hip_raise_with_knee_squeeze', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'chair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dead_hang_biceps_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_dumbbell_diagonal_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'body_weight_dip', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'partial_lockout', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bench_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_dumbbell_flye', ec.id
FROM exercise_categories ec
WHERE ec.name = 'flye'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bent_over_row_with_barbell', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'leaning_dumbbell_lateral_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_hip_raise_with_foot_on_medicine_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_side_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_pigeon_pose', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_reverse_lunge_to_high_knee_and_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'elevated_feet_russian_twist', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cns_critical', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_swiss_ball_pike', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bench_dip', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'plank_to_stand_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'triceps_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'floor_i_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_explosive_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_crossover_chin_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_hip_stretchup', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_wide_leg_forward_bend', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'automatic', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_bent_knee_swiss_ball_reverse_hip_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bent_knee_swiss_ball_reverse_hip_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'body_weight_wall_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ninety_ninety_hip_switch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'spinal_twist_stretch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'triceps_extension_on_floor', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'arm_rotations', ec.id
FROM exercise_categories ec
WHERE ec.name = 'flye'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'criss_cross_with_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_plie_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'double_arm_side_wave', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bear_crawl_pull_through', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sandbag'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_suspended_inverted_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'none', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kettlebell_swing', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alternating_dumbbell_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_y_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'trunk_rotations', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_three_part_roll_down', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'mountain_climber_with_hands_on_swiss_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'wheel', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'backup_only', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_hang_power_snatch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_single_leg_hip_raise_with_foot_on_bosu_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'mcgill_curl_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'neck_flexion_and_extension_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_alternating_reverse_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_burpee_box_jump', ec.id
FROM exercise_categories ec
WHERE ec.name = 'total_body'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_leg_lowering_drill', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_kneeling_ab_wheel', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'one_arm_one_leg_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'floor_y_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_dumbbell_calf_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'calf_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_straight_leg_deadlift_to_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'po2_crit_high', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_hip_raise_and_leg_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_snatch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_arm_kettlebell_swing', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_swing'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'run', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lateral_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_arm_step_up_and_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'warrior_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_side', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_grip_barbell_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'tricep_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'knees_to_elbow', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_plank_to_plank_with_reach_under', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_leg_extensions', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_row_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alert_dismissed_by_timeout', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_single_leg_swiss_ball_jackknife', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_rear_leg_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_hip_raise_with_foot_on_bosu_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_hang_squat_clean', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_leg_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'zhl_16c', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'thread_the_needle_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'split', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hanging_leg_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_close_grip_chin_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'one_arm_one_leg_deadlift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'deadlift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'push_up_with_one_hand_on_medicine_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'workout_round', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'plank_with_arm_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'threat_none', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_clean', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ski_lift_split', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_u_boat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_reverse_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_biceps_curl_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'peaceful_warrior', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'neck_pull', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_shrug', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shrug'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'triceps_extension_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_dumbbell_overhead_triceps_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'core_control_rear_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'upper_cuts', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'light', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'tailbone_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_ez_bar_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'punch_up_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_squat_clean', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ankle_dorsiflexion_with_band', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_mountain_climber', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bear_crawl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'floor_t_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cable_lying_triceps_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_t_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_single_leg_squat_on_swiss_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kettlebell_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'double_arm_wave', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_crossed_arms_sit_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'scorpion', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_superman_from_floor', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'spine_stretch_forward', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_side_lying_leg_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kneeling_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'behind_the_back_shrug', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shrug'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_side_plank_with_reach_under', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ring_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'elevated_single_leg_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'po2_ccr_dil_low', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_biceps_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_side_plank_with_leg_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_modified_front_lever', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'suspended_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'squat_thrusts', ec.id
FROM exercise_categories ec
WHERE ec.name = 'total_body'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'arm_circles_with_ball_band_and_weight', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_plank_jacks_with_feet_on_sliding_discs', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_calf_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'calf_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'deep', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_bend_low_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'wide_grip_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'forward_bend_biceps_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'medicine_ball_leg_drops', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'thoracic_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'unmeasurable', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alternating_box_dumbbell_step_ups', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'neck_tilts', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'interval_recovery', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'incline_dumbbell_bench_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bench_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'high_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_sumo_squat_slide_in', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'switched_to_closed_circuit', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'star_jump_squats', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_shifting_side_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'all_fours', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'mountain', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_stability_reverse_chop', ec.id
FROM exercise_categories ec
WHERE ec.name = 'chop'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'elevated_feet_inverted_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_wide_stance_plank_with_diagonal_arm_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_l_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_barbell_deadlift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'deadlift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_hanging_knee_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'high_plank_leg_lifts', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'leg_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_lateral_raise_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_arm_circles', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'pole_paddle_backward_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_bridge_with_leg_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'rope_climb', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_tabletop_dip', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_single_leg_lowering_drill', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_squat_with_heels_raised', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'elevated_ring_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kicks', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_triple_stop_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'fish', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'squat_open_arm_twist_pose', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'jumping_jack', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_swiss_ball_plank_leg_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_back_extension_with_opposite_arm_and_leg_reach', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_side_to_side_shuffle_jump', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ascent_split', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'inchworm_to_side_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'squat_open_arm_twist', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_alternating_dumbbell_biceps_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'upper_back_stretch_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'breathing_punches_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'pilates_roll_up_with_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'sit_ski_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'jump_rope_crossover', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_split_jump', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bicep_curl_with_leg_extension_with_weights', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_power_clean_and_push_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ring_plank_sprawls', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'straight_arm_pull_down_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'medicine_ball_chest_pass', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'abs_jabs', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'front_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_side_plank_with_feet_on_bench', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'off_wrist', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lower_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'knee_drive_jump', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_incline_l_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'box_jump_overs', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'crossover_dumbbell_step_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'pole_rainbow_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'upright_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shrug'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'tick_tock_side_roll', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_bottle_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lying_internal_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'quadruped_leg_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hindu_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'corpse', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_reverse_wrist_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'gunslinger_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'squats_with_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_t_stabilization', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'decline_dumbbell_bench_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bench_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_parallette_handstand_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_and_crossover_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_plank_pike_jumps', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'biceps_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'straight_leg_deadlift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'deadlift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_standing_adduction', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'quadruped_hip_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sandbag'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'turkish_get_up_to_side_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'rowing_1', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kettlebell_deadlift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'deadlift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_hyperextension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kneeling_woodchopper', ec.id
FROM exercise_categories ec
WHERE ec.name = 'chop'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_incline_rear_leg_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hollow_hold_and_roll', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_front_split_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'plank_pikes', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kneeling_lat_pulldown', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kipping_handstand_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_kneeling_superman', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_to_side_lunge_chops', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'scapular_retraction', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shrug'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'down_dog_split_open_hip_bent_knee', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'whr', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_windmill_switches', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'crunch_chop', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'active_frog', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT '45_degree_cable_external_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'overhead_dumbbell_reverse_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_squat_snatch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'serratus_shrug', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shrug'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'deadbug', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_pike', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'glute_bridge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'base_rotations', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'banded_face_pulls', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'renegade_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'back_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'depth', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'sumo_squat_to_stand', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'overhead_dumbbell_press_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'spiderman_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bent_knee_v_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'incline_reverse_flye', ec.id
FROM exercise_categories ec
WHERE ec.name = 'flye'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'knees_chest_chin', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_seated_calf_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'calf_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_side_and_crossover_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_standing_t_rotation_balance', ec.id
FROM exercise_categories ec
WHERE ec.name = 'total_body'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_lateral_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'staggered_stance_good_morning', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'the_teaser', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'walk', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_levator_scapulae', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_hanging_knee_raise_oblique_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'heros', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'wall_walk', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'arm_stretch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_plank_with_leg_pull', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'supine_spinal_twist', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sandbag'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dolphin', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'double_arm_side_to_side_snake', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'agility', ec.id
FROM exercise_categories ec
WHERE ec.name = 'ladder'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_mcgill_curl_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'sliding_leg_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_t_hip_opener', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_arm_kettlebell_snatch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'the_hundred', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'low_lunge_with_isometric_adduction', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'wide_grip_lat_pulldown', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_side_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alternating_plate_reach', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ankle_internal_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'biceps_stretch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'front_foot_elevated_dumbbell_split_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'glutes_stretch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'half_moon', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'uneven_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'high_pull_burpee', ec.id
FROM exercise_categories ec
WHERE ec.name = 'total_body'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'rolling', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_step_climb', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'rowing_1_with_weights', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_clam_bridge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_leg_u', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lateral_plyo_squats', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_lunge_with_twist_and_overhead_reach', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_front_knee_strike', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_rotational_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lunge_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_side_lunge_to_crossover_tap', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'back_foot_elevated_dumbbell_split_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'wide_stance_plank_with_diagonal_arm_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'plie_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stair_stepper', ec.id
FROM exercise_categories ec
WHERE ec.name = 'stair_stepper'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_hip_raise_with_knee_squeeze', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'shifting_side_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'wide_stance_plank_with_leg_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_close_hands_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_lying_leg_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_lateral_stepover', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_ez_bar_overhead_triceps_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_hip_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'triceps_pressdown', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reach_roll_and_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_plank_wave', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'diamond_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kettlebell_swing_with_flip_to_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_kick_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_sumo_squat_with_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'scaption', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_reverse_dumbbell_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_chin_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_squat_plank_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'total_body'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'partial_single_leg_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bike', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bike'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lateral_raise_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_barbell_straight_leg_deadlift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'deadlift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_hip_extension_and_cross', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_swiss_ball_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_swiss_ball_t_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_single_leg_dip', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'core_twists_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_to_side_leg_swings', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_clapping_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_jump_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'plank_with_knee_to_elbow', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_high_box_jump', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'arnold_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_reverse_crunch_on_a_bench', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'low_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'footwork', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_bench_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'squat_and_side_kick', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_lunge_with_spinal_twist', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_swiss_ball_push_up_plus', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hip_circles', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'push', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sled'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cactus_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'straight_leg_diagonal_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'body_weight_jump_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sandbag'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ez_bar_overhead_triceps_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'rdl_bent_over_row_with_barbell_dumbbell', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_lying_knee_to_chest', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_three_way_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_side_stretch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_kickback_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'shoulder_sweeps', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_kneeling_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'squat_plank_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'total_body'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_handstand_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'overhead_dumbbell_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'total_body_burpee_over_bar', ec.id
FROM exercise_categories ec
WHERE ec.name = 'total_body'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'split_jerk', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'incline_ez_bar_lying_triceps_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_hanging_hurdle', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'overhead_dumbbell_triceps_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_bench_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bench_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'inner_thigh_side_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 't_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'groiners', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'static_back_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'butterfly_sit_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_side_to_side_lunge_chops', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_hip_raise_with_head_on_bosu_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_diagonal_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'diagonal_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cross_body_mountain_climber', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_swiss_ball_plank_leg_lift_and_hold', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'chin_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'supine_hip_internal_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_staggered_hands_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_bend_mid_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'towel_grip_inverted_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_hip_thrust_on_floor', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_elevated_feet_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'floor_inverted_shoulder_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'arm_circles', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_single_leg_hip_raise_with_foot_on_foam_roller', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_inverted_row_with_feet_on_swiss_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'turkish_get_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cable_woodchop', ec.id
FROM exercise_categories ec
WHERE ec.name = 'chop'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cross_punch_roll_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cable_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_push_up_plus', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'continuous_check', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_kickback', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_elevated_feet_russian_twist', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_seated_leg_u', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bent_over_row_with_dumbell', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'split_stance_offset_pinky_dumbbell_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_bench_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bench_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kettlebell_sumo_deadlift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'deadlift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'mountain_climber_with_hands_on_bench', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'open_knee_tucks', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'external_rotation_at_90_degree_abduction', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'arrow', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'twisting_standing_dumbbell_biceps_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'wall_crawl_with_external_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_dumbbell_overhead_triceps_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'roll_over', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'half_chair_half_ankle_to_knee', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cross_leg_reverse_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_lying_abduction', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lower_lift_with_weights', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'shouldering', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sandbag'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'knee_raises', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'rope_handle_cable_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'burpee_box_jump_step_up_over', ec.id
FROM exercise_categories ec
WHERE ec.name = 'total_body'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_upright_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shrug'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_reverse_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_grip_wrist_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'double_punch_up_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'modified_front_lever', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_incline_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kettlebell_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_wide_stance_plank_with_opposite_arm_and_leg_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'overhead_barbell_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_leg_raise_on_swiss_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'medicine_ball_mountain_climber', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'jump_rope_jog', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_hang_snatch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_leg_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'plank_pull_through', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sandbag'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ez_bar_preacher_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'wide_stance_plank_with_diagonal_leg_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'band_external_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'shrug_arm_up_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shrug'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_hip_raise_with_knee_hold', ec.id
FROM exercise_categories ec
WHERE ec.name = 'calf_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bow', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_arm_reverse_lunge_and_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_elevated_feet_inverted_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_inverted_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_push_up_and_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_lunge_jump_off', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_arm_cable_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_swiss_ball_jackknife', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'zercher_good_morning', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_foam_roller_reverse_crunch_on_bench', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_easy_twist', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'breathing_punches_extended_side_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'quadruped_with_leg_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'chest_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_lat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_donkey_calf_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'calf_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_supine_hip_internal_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT '90_degree_static_hold', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'behind_the_back_barbell_reverse_wrist_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_arm_dumbbell_overhead_triceps_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_serratus_chair_shrug', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shrug'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_incline_t_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'incline_dumbbell_biceps_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'triple_under', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lateral_duck_under', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'neutral_grip_dumbbell_bench_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bench_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_alternating_slide_out', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'incline_dip', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'rotational_dumbbell_straight_leg_deadlift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'deadlift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'medicine_ball_side_throw', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'speed', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'step_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'mountain_climber_on_sliding_discs', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'y_fly', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_ring_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_floor_y_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'low_push', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sled'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'elbow_to_foot_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'close_grip_barbell_bench_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bench_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'push_jerk', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bent_knee_reverse_hyperextension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'shoulder_abduction', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_plank_with_knee_circle', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_forward_bend_halfway_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'plank_knee_tucks', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_straight_arm_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_arm_neutral_grip_dumbbell_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'push_up_and_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_single_leg_forward_bend_with_it_band_opener', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'thrusters', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'air_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'combo_shoulder_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'farmers_walk_on_toes', ec.id
FROM exercise_categories ec
WHERE ec.name = 'carry'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'thread_the_needle', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'arm_circles_mid_forward_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_rotational_chop', ec.id
FROM exercise_categories ec
WHERE ec.name = 'chop'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_reverse_sliding_box_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_face_pull_with_external_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_hang_pull', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'shoveling', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sandbag'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_partial_single_leg_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'transition', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'pistol_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_box_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_snatch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_power_clean_and_strict_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bar_muscle_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'donkey_kick', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cable_crossover', ec.id
FROM exercise_categories ec
WHERE ec.name = 'flye'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'upward_facing_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'leg_extensions', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'behind_the_back_smith_machine_shrug', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shrug'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_medicine_ball_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'backward_drag', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sled'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'forward_fold', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'sumo_squat_to_high_pull', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'leg_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_90_degree_static_hold', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'triple_stop_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_waiter_carry', ec.id
FROM exercise_categories ec
WHERE ec.name = 'carry'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'burpee', ec.id
FROM exercise_categories ec
WHERE ec.name = 'total_body'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'low', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_swiss_ball_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'negative_sit_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'spot_check', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alternating_dumbbell_biceps_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'fresh', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'staggered_hands_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_wide_leg_forward_bend', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_swiss_ball_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_back_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_side_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'forward_drag', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sled'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'toes_to_bar', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_serratus_shrug', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shrug'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ring_muscle_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hip_stretch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_bent_knee_v_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'extended_toe_touch_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hip_circles', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lunge_with_arm_reach', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_thrusters', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'high', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_siff_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'leg_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'rotational_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'low_lunge_with_knee_down', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'wide_stance_goblet_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'indoor_track_run', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'rollout', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'neutral_pelvic_position', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'medicine_ball_deadlift_to_reach', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alternating_wave_with_lateral_shuffle', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'plank_with_oblique_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'suspended_chin_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_box_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_biceps_curl_with_static_hold', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'squat_jump', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_single_leg_donkey_calf_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'calf_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_cross_punch_roll_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'serratus_chair_shrug', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shrug'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'walking_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_opposite_arm_and_leg_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_biceps_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'one_arm_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_dumbbell_chest_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bench_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'overhead_lunge_with_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'rwd_stand', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'pull_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'inchworm', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'revolved_triangle', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'waist_slimming_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_burpee', ec.id
FROM exercise_categories ec
WHERE ec.name = 'total_body'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_side_plank_and_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_double_under', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'medicine_ball_clean', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_pike_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'scissors_with_weights', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'full_split', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_step_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_abs_jabs', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'supine_floor_barre', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT '3_way_single_leg_calf_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'calf_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lunge_matrix', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_lying_lateral_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'back_extension_with_opposite_arm_and_leg_reach', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'close_grip_chin_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_romanian_deadlift_circuit', ec.id
FROM exercise_categories ec
WHERE ec.name = 'deadlift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_dumbbell_biceps_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_body_weight_wall_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'band_assisted_chin_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'sidewinder', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_straight_leg_deadlift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'deadlift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'leg_circles', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'sprint', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bike'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_push_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_reverse_curl_and_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'sumo_deadlift_high_pull', ec.id
FROM exercise_categories ec
WHERE ec.name = 'deadlift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cable_diagonal_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'chest_expand_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kettlebell_floor_to_shelf', ec.id
FROM exercise_categories ec
WHERE ec.name = 'deadlift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_side_step', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'inverted_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cable_kickback', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'grappler_toss', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'upright_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'pretzel_side_kick', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'rowing_machine', ec.id
FROM exercise_categories ec
WHERE ec.name = 'indoor_row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_dumbbell_seated_overhead_triceps_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_wall_chest_and_shoulder', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'half_kneeling_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'chop'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cns_warning', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'left_hand_back_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'one_arm_push_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_external_hip_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_dumbbell_shoulder_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'squat_jacks', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'straight_leg_diagonal_crunch_with_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_wrist_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'walking_dumbbell_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_grip_pressdown', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_mountain_climber_with_hands_on_bench', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_single_leg_bench_dip_and_kick', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'at_depth', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'decline_ring_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'downward_facing_dog_to_cobra', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'face_down_incline_reverse_flye', ec.id
FROM exercise_categories ec
WHERE ec.name = 'flye'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'toe_touch_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alternating_hands_medicine_ball_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'latissimus_dorsi_foam_roll', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'one_hand_dumbbell_split_snatch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'overhead_carry', ec.id
FROM exercise_categories ec
WHERE ec.name = 'carry'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_deadlift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'deadlift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'down_dog_knee_to_nose', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cadence', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_alternating_dumbbell_curls', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_overhead_bulgarian_split_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'plank_jacks_with_feet_on_sliding_discs', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'safety_stop_complete', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'double_punch_down_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'fly', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_rolling_side_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ring_dip_kipping', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_double_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'pull_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'inverted_shoulder_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_one_arm_floor_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bench_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'corkscrew', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'baby_cobra', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cheating_barbell_biceps_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'double_under', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_stepover', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'marching_hip_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kbs_overhead', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hip_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'push_ups', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'depth_jump', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'step_out_swing', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_swing'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'goblet_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'deco_ceiling_broken', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alternating_dumbbell_chest_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bench_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'up_dog', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_alternating_jump_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'prayer_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'squat_jumps_in_and_out', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_dumbbell_toe_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'calf_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'face_pull_with_external_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'run_or_walk', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'v_sit', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'straight_arm_pulldown', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sled'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bicep_curl_with_leg_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_dead_bug', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'static_lying_triceps_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'chest_openers', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'step_climb', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hanging_knee_raise_oblique_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'handstand_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'front_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sandbag'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'overhead_dumbbell_triceps_extension_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_hip_thrust_with_bench', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'apnea_high_speed', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cable_front_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'chest_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hamstring_curls', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'medicine_ball_slam', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_elevator_abs', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_neck', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_prone_hip_internal_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_l_pull_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'overhead_barbell_shrug', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shrug'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'overhead_dumbbell_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_explosive_crossover_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_push_up_plus', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hand_release_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'en13319', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cross_knee_strike', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_cross_leg_reverse_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'trx_suspended_jackknife', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_jumping_pull_ups', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_modified_mountain_climber_and_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'onboard_gps', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_quad', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'low_side_to_side_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'shoulder_external_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lateral_leap_and_hop', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT '3_way_weighted_calf_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'calf_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'incline_smith_machine_bench_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bench_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'flat_24_hours', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_single_leg_elevated_feet_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_curl_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_swiss_ball_prone_jackknife', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_plank_to_stand_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_single_leg_side_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_spine_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kettlebell_chest_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bench_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_plank_leg_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'releve_straight_leg_and_knee_bent_with_one_leg_variation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'walking_knee_hugs', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'incline_dumbbell_flye', ec.id
FROM exercise_categories ec
WHERE ec.name = 'flye'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'elevated_feet_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'forward_fold_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_i_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'arm_circles_low_forward_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_dumbbell_lying_triceps_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'offset_dumbbell_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_quadruped_hip_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lateral_band_walks', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_dumbbell_crossover_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'leg_abduction', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_rear_lateral_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'clean', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_jackknife', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'calf_raises', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'twist', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_cross_knee_strike', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'one_legged_downward_facing_pose_open_hip_bent_knee', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'mixed_grip_pull_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'butterfly_arms_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_standing_calf_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'calf_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alternating_dumbbell_chest_press_on_swiss_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bench_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_grip_pulldown', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'walkout', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'smith_machine_bench_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bench_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'braced_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'leg_climb_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'isometric_explosive_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'wide_grip_ez_bar_biceps_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'quadruped', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_neutral_grip_chin_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'marching_hip_raise_with_feet_on_a_swiss_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_shoulder_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'zercher_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sandbag'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alternating_staggered_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hip_extension_and_cross', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'leg_lift_in_external_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'rear_delt_fly_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'flye'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'superman_on_swiss_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_dumbbell_external_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_l_sit', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_power_clean_and_jerk', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_plank_with_leg_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'breathing_punches_side_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'sumo_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_incline_i_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_dumbbell_box_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_mountain_climber_with_feet_on_bosu_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'overhead_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sandbag'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kneeling_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_v_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_squat_jacks', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_zottman_biceps_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ankle_lunges', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'arm_and_leg_extension_on_knees', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ascent_critical', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_triangle_hip_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'wide_grip_barbell_shrug', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shrug'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'underhand_grip_cable_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'mixed_grip_chin_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bridge_with_leg_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_ez_bar_pullover', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'external_hip_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_walking_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'thunderbolt', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'pole_paddle_forward_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_side_split', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_hip_crossover', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'gate', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'shoulder_tapping_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_cable_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'full_plank_passe_twist', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kneeling_cable_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_wide_hands_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_close_grip_medicine_ball_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'face_pull', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'foam_roller_reverse_crunch_with_dumbbell', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_hollow_rock', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'push_up_with_feet_on_swiss_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'fire_hydrant_kicks', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lat_pulldown', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'one_legged_pigeon', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_45_degree_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kneeling_oblique_cable_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'straight_arm_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kneeling_underhand_grip_lat_pulldown', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'incline_t_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weight_plate_front_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_deadlift_with_barbell', ec.id
FROM exercise_categories ec
WHERE ec.name = 'deadlift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'plank_knee_crosses', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'table_top', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'wide_hands_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'pressure_sac', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_side_plank_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_donkey_calf_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'calf_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'heron', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'underhand_grip_rear_lateral_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_hip_flexor_and_quad', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_90_90', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alternating_wave', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'shaving_the_head', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'clean_and_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sandbag'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'overhead_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_dumbbell_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'fire_hydrant', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'pendulum', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ghd_sit_ups', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'prisoner_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'face_pull', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'sumo_squat_with_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_hollow_hold_and_roll', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'overhand_grip_rear_lateral_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'explosive_crossover_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'inverted_row_with_feet_on_swiss_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_boat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'v_leg_crunches', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_cross_body_mountain_climber', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_hang_squat_snatch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_warrior_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'pilates_pushup', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_kicks', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_arm_medicine_ball_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_box_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_mountain_climber', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'split_stance_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'four_limbed_staff', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_plank_pikes', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_lateral_leap_and_hop', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'half_kneeling_arm_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'inverted_hamstring_stretch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_lateral_roll', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_forward_bend', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_push_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'back_squats', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'burpee_box_jump_over_yes_literally_jumping_over_the_box', ec.id
FROM exercise_categories ec
WHERE ec.name = 'total_body'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hammer_slam', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sledge_hammer'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_inchworm_to_side_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_reverse_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lateral_barbell_burpee', ec.id
FROM exercise_categories ec
WHERE ec.name = 'total_body'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bike', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bike_outdoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'thunderbolt_pose_both_sides_arm_stretch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_barbell_good_morning', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_figure_four_squats', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'double_arm_figure_eight', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_plank_knee_twist', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'curl_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'face_pull_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'breathing_punches_overhead_and_down_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_mountain_climber_on_sliding_discs', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'mountain_climber', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_push_up_with_one_hand_on_medicine_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reclining_circle', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'half_kneeling_rotational_reverse_chop', ec.id
FROM exercise_categories ec
WHERE ec.name = 'chop'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cable_overhead_triceps_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'safety_stop_broken', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_front_squat_to_push_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'open_circuit', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'overhead_lunge_with_medicine_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_hanging_single_leg_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_kipping_pull_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'auto_setpoint_switch_ignored', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_bench_dip_and_kick', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'saw', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'arm_circles_high_backward_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_forward_glutes', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lying_concentration_cable_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'surf_active', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_full_plank_passe_twist', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'squat_clean_and_jerk', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_step_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'mountain_climber', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_jump_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bent_over_lateral_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'deep_breathing_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'shaving_the_head_with_ball_band_and_weight', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_t_rotation_balance', ec.id
FROM exercise_categories ec
WHERE ec.name = 'total_body'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'battery_low', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'decline_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ski_run_split', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_cable_pullover', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'sprint', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sandbag'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_sliding_lateral_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hamstring_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'elliptical', ec.id
FROM exercise_categories ec
WHERE ec.name = 'elliptical'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alternating_slide_out', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lunge_with_side_bend', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'incline_offset_thumb_dumbbell_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_wall_slide', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'incline_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_reverse_hip_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lateral_roll', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_standing_calf_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'calf_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'piriformis_stretch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_scorpion', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_single_leg_hip_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'half_kneeling_stability_chop', ec.id
FROM exercise_categories ec
WHERE ec.name = 'chop'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_squat_on_swiss_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'snatch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_plank_with_arm_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'diamond_leg_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_power_squat_chops', ec.id
FROM exercise_categories ec
WHERE ec.name = 'chop'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_lowering_drill', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'chest_press_with_band', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'explosive_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'interval_active', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'elbow_to_knee_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hip_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_single_leg_forward_bend', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'spine_lateral_flexion_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_arm_dumbbell_bench_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bench_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_wide_stance_plank_with_leg_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_bend', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'neutral_grip_pull_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_arm_dumbbell_swing', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_swing'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_swiss_ball_rollout', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_isometric_explosive_jump_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_calf_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'calf_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'tabletop_dip', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hanging_knee_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_front_raise_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'pelvic_clocks_on_disc', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hanging_hurdle', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_dumbbell_internal_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'spiderman_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'wide_grip_overhead_barbell_split_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'walking_high_knees', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'figure_four_squats', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'frog_with_band', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'superman_from_floor', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'forward_fold_plus_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_trx_inverted_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'connected_gps', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'trap_bar_deadlift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'deadlift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'modified_inverted_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_split_rotational_chop', ec.id
FROM exercise_categories ec
WHERE ec.name = 'chop'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_hamstring', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_lying_piriformis', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'box_jump_overs_over_the_box', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'rolling_side_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cable_external_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'teaser', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_lateral_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_grip_incline_bench_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bench_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_hip_circles', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_plank_with_reach_under', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cobra', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'indoor_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_elevated_feet_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swimming', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lateral_flexion', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alternating_incline_dumbbell_biceps_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'tree', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'walkout_from_push_up_position', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'breathing_punches_extended_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kneeling_rotational_chop', ec.id
FROM exercise_categories ec
WHERE ec.name = 'chop'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'plank_with_arm_variations', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'wide_stance_plank_with_opposite_arm_and_leg_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_the_hundred', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cable_internal_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_raised_legs_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kneeling_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'revolved_head_to_knee', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'neck_lateral_flexion_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'crescent_circle', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'power_pull', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_elbow_plank_pike_jacks', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'face_pull', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'elevated_front_foot_barbell_split_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_grip_triceps_pressdown', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'decline_hammer_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_ring_muscle_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stationary_bike', ec.id
FROM exercise_categories ec
WHERE ec.name = 'indoor_bike'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'l_pull_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'split_barbell_good_morning', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'mermaid_stretch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_trx_suspended_jackknife', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'front_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stacked_feet_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'triangle_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'deep_breathing_mid_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_plyometric_side_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'frog_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'plate_raises', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'clean_and_jerk', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_hip_abduction', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'awake', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_x_abs', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'clam_shells', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_power_clean', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'downward_facing_dog', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'runners_lunge_to_balance', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'close_grip_ez_bar_biceps_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'jumping_jacks', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'triceps_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'half_kneeling_stability_reverse_chop', ec.id
FROM exercise_categories ec
WHERE ec.name = 'chop'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dynamic_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'back_squat_with_body_bar', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_squat_jump_onto_box', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_lunge_to_crossover_tap', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'spinning', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_single_leg_bench_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_curtsy_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'snake_wave', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'apnea_low_speed', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_standing_dumbbell_calf_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'calf_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'arm_raise_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'isometric_barbell_bench_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bench_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_sit_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'farmers_walk', ec.id
FROM exercise_categories ec
WHERE ec.name = 'carry'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_plank_leg_lift_and_hold', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'overhead_dumbbell_split_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_arm_cable_row_and_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'tricep_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'rwd_run', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'threat_approaching_fast', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'roll_down', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'po2_warn', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_back_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'otu_warning', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ski_moguls', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_hovering_sit_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'modified_mountain_climber_and_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_single_arm_inverted_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_staggered_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_to_side_shuffle_jump', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_barbell_shoulder_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_turkish_get_up_to_side_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_cable_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 't_bar_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_step_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_cat_cow', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'air_bike', ec.id
FROM exercise_categories ec
WHERE ec.name = 'indoor_bike'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'neutral_grip_chin_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_reverse_curl_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_alternating_staggered_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'latpull', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_shrug_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shrug'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'treadmill', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'plank_knee_twist', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_suspended_chin_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'russian_twist', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sandbag'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'approach', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_cardio_core_crawl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_single_leg_bent_knee_calf_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'calf_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'pole_handcycle_forward_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'medicine_ball_alternating_v_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'scapular_stabilization', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dead_bug', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'front_knee_strike', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_hip_raise_with_head_on_bosu_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'battery_critical', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lateral_slide', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ribcage_breathing', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_crunch_on_a_bench', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'suitcase_squats', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'plow', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_split_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'incline_dumbbell_shrug', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shrug'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'balanced', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_hip_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lateral_walks_with_band_at_ankles', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_rdl_circuit', ec.id
FROM exercise_categories ec
WHERE ec.name = 'deadlift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cat_camel', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'roll_up_with_weight_and_band', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'unbalanced', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'neck_rotations_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hip_raise_with_head_on_swiss_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'leg_levers', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'neutral_grip_alternating_dumbbell_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_butterfly_situp', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'the_teaser_weighted', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bent_arm_lateral_raise_and_external_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_side_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_bob_and_weave_circle', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_reverse_leg_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_uneven_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'sliding_lateral_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ankle_stretch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'burpee_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'total_body'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_ring_dip', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_standing_hip_abduction', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_swiss_ball_plank_with_feet_on_bench', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'double_arm_slam', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'rotational_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sandbag'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'towel_plank_and_knee_in', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_hamstring_stretch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_circles', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_swiss_ball_w_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'incline_barbell_bench_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bench_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'triangle', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'shoulder_flexion_to_90_degrees', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reach_forward_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'feet_elevated_side_to_side_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'back_roll_foam_roller', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'banded_pull_ups', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alternating_dumbbell_lying_triceps_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_step', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'pull_down_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alternating_dumbbell_shoulder_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_t_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'mountain_climber_with_feet_on_bosu_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'overhead_press_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lateral_swing', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sledge_hammer'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'assioma_duo', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_diagonal_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bottle_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ring_l_sit', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ring_handstand_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_curl_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_modified_inverted_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'one_legged_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_w_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cow', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'sit_up_turkish_get_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'v_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alternating_figure_eight', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'throat_lock', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_straddle', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'crossed_arms_sit_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'scissor_power_switch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_bent_knee_calf_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'calf_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'sleeper_stretch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'raised_legs_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'farmers_carry_walk_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'carry'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_bench_dip', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'internal_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dead_curl_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_bench_squat_with_rotational_chop', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'close_grip_lat_pulldown', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'windsurf_active', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'pole_dd_ff_uu_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'parallette_handstand_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'eight_point_shoulder_opener', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_side_plank_with_elbow_on_bosu_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bar_good_morning', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'x_abs', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'body_bar_oblique_twist', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'arm_circles_high_forward_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hip_raise_with_head_on_bosu_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_trunk_rotations', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'run_rest', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_ez_bar_biceps_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kneeling_stability_chop', ec.id
FROM exercise_categories ec
WHERE ec.name = 'chop'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'one_legged_dumbbell_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_floor_t_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'chest_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sled'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_split_jacks', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'modified_sit_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'clap_wave', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'incline_l_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cable_core_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_dumbbell_biceps_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_hanging_l_sit', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_piriformis', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'interval_rest', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'one_arm_bent_over_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'run_active', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dip', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'scissors_on_disc', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'neck_rotations', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'shrug_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shrug'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_prone_jackknife', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'childs', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bear_hug_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sandbag'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bar_holds', ec.id
FROM exercise_categories ec
WHERE ec.name = 'carry'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'man_makers', ec.id
FROM exercise_categories ec
WHERE ec.name = 'total_body'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'threat_unknown', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_pectoral', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'pilates_plie_squats_parallel_turned_out_flat_and_heels_with_chair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_swiss_ball_i_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_shoulder_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'pike_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'sitting_jacks_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'wall_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'arm_circles_low_backward_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_jump_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_adduction', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_pilates_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'wide_grip_jump_shrug', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shrug'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_arm_dumbbell_shoulder_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_lunging_hip_flexor', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cable_side_bend', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'triceps_stretch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'punch_forward_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'sit_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'runners_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_front_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_wide_grip_pull_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alternating_barbell_forward_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_side_kick_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cycling_russian_twist', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'leg_stretch_with_band', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_to_side_medicine_ball_throws', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'walking_leg_cradles', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'static_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_side_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_reach_roll_and_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'manual', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'chest_supported_dumbbell_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_neutral_grip_pull_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_deadlift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_lunge_and_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_hip_raise_with_foot_on_foam_roller', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'rowing_2_with_weights', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hammer_curl_to_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'shoulder_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_spiderman_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'neutral_grip_dumbbell_incline_bench_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bench_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'scaption_and_shrug', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shrug'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lateral_dumbbell_step_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT '3_way_calf_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'calf_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_kneeling_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'start', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT '30_degree_lat_pulldown', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_reverse_leg_raise_on_swiss_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'inverted_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hollow_rock', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_jumping_jacks', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_lunge_matrix', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hamstring_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'donkey_calf_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'calf_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'medicine_ball_sit_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hug_a_tree', ec.id
FROM exercise_categories ec
WHERE ec.name = 'flye'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'wide_grip_barbell_bench_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bench_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_reverse_lunge_with_reach_back', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'one_arm_full_sit_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'depth_alert', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_hanging_leg_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'squat_to_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hamstring_stretch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'spinal_twist', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_depth_jump', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'double_punch_sideways_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_hack_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_reverse_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_reverse_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_reverse_lunge_with_twist_and_overhead_reach', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kettlebell_leg_raises', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'inside_circle', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_side_lunge_and_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_barbell_box_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'half_turkish_get_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'rmv', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_sumo_squat_to_stand', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_marching_hip_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_stepover', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alternating_kneeling_to_standing_wave', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alternating_lateral_raise_with_static_hold', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'l_sit', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_mixed_grip_pull_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_swiss_ball_wall_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_russian_twist_on_swiss_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hrm', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bridge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'shoulder_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'spine_flexion_and_extension_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_inching_elbow_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_kneeling_cross_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lying_dumbbell_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'chest_fly_decline_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_quarter_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'locust', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_bend_high_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'incline_i_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_twist', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_romanian_deadlift_with_dumbbell', ec.id
FROM exercise_categories ec
WHERE ec.name = 'deadlift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'breathing_punches_overhead_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'incline_y_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_underhand_grip_cable_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_mountain_climber_with_hands_on_swiss_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_lunge_and_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'interval_warmup', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cat_cow', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_ghd_back_extensions', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'band_side_lying_leg_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'enabled', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'flip', ec.id
FROM exercise_categories ec
WHERE ec.name = 'tire'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_box_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_pilates_roll_up_with_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_side_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_criss_cross', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_get_up_sit_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'belly_breathing', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'rack_pull', ec.id
FROM exercise_categories ec
WHERE ec.name = 'deadlift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'push_up_plus', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'three_way_ankle_mobilization', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'deep_breathing_high_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_straight_arm_plank_with_shoulder_touch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lying_dumbbell_pullover_to_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_suspended_dip', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'jog', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'sphinx', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'warrior_two', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'three_part_roll_down', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_inner_thigh_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_bent_knee_reverse_hyperextension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_incline_w_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cross_chop_to_knee', ec.id
FROM exercise_categories ec
WHERE ec.name = 'chop'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_rollout', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT '45_degree_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_jump_shrug', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shrug'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'plate_pinch_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'jump_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plyo'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ring_dip', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lateral_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_plank_with_feet_on_bench', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_reverse_wrist_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'breathing_punches_overhead_side_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_split_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'arnold_press_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alternating_dumbbell_lunge_with_reach', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_judo_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'romanian_deadlift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'deadlift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hip_toss', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_side_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_biceps_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'russian_twist', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cable_biceps_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'smith_machine_overhead_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'split_jacks', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_stacked_feet_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'incline_reverse_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_lying_reverse_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_towel_pull_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'band_assisted_pull_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_sliding_box_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'chest_fly', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_feet_elevated_side_to_side_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'drop_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_plank_with_oblique_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_grip_barbell_biceps_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_dip', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'suspended_inverted_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'descent_split', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'abdominal_leg_rotations', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'incline_w_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_crunch_chop', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_arm_cable_chest_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'bench_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'jumping_jacks', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'pilates_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hovering_sit_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ez_bar_pullover', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_plank_knee_tucks', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'overhead_bulgarian_split_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'quadruped_rocking', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alternative_skiing_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cow_face', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lying_straight_leg_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'shrug_arm_mid_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shrug'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'ankle_to_knee', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'u_boat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'deco_complete', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_long_leg_forward_bend', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'wall_ball_squat_and_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'rowing_2', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'setpoint_switch_manual_low', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_towel_plank_and_knee_in', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_lunge_with_reach_back', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bosu_ball_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'complete', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_quadruped_with_leg_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_prisoner_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'closed_circuit_diluent', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'two_point_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'leg_adduction', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_power_snatch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_bear_crawl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_inverted_shoulder_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'leg_stretch_with_leg_circles', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_triceps', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_pretzel_side_kick', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'climb_rest', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'extended_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'disabled', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'shoulder_circles', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_single_leg_hip_raise_with_head_on_bosu_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'crossed_arm_barbell_front_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'wide_grip_seated_cable_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'stretch_over_under_shoulder', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'circular_arm_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_thoracic_crunches_on_foam_roller', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lying_ez_bar_triceps_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'in_and_out_wave', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bicycle', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_swiss_ball_back_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_windshield_wipers', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'one_arm_row_with_band', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_side_opener', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_hip_raise_with_feet_on_swiss_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'squat_american_swing', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_front_kick_tabletop', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'prayer_mudra', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_arm_standing_cable_reverse_flye', ec.id
FROM exercise_categories ec
WHERE ec.name = 'flye'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_hammer_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_standing_rear_leg_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_side_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_double_leg_stretch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'squat_palm_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'back_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sandbag'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'straight_leg_crunch_with_leg_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'crossed_arms_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'apnea_neutral_buoyancy', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'inner_thigh_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'hip_drop', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_dip', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'around_the_world_wheelchair', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'roll_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'medium', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'alternating_lunge_wave', ec.id
FROM exercise_categories ec
WHERE ec.name = 'battle_rope'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'seated_dumbbell_shoulder_press', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_press'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_hip_raise_with_foot_on_bench', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'suspended_dip', ec.id
FROM exercise_categories ec
WHERE ec.name = 'triceps_extension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'knee_to_chest', ec.id
FROM exercise_categories ec
WHERE ec.name = 'suspension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kipping_parallette_handstand_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_single_leg_reverse_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_overhead_walking_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_curl_and_lift', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'snake_twist_1_and_2', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'band_internal_rotation', ec.id
FROM exercise_categories ec
WHERE ec.name = 'shoulder_stability'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'warrior_one', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_side_plank_with_knee_circle', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'plyometric_side_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_back_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'straight_leg_crunch_with_legs_crossed_with_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'one_arm_swing', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_swing'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'barbell_crossover_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'side_plank_leg_lifts', ec.id
FROM exercise_categories ec
WHERE ec.name = 'banded_exercises'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'spine_extension', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_squat_clean', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'reverse_sliding_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'pelvic_clocks', ec.id
FROM exercise_categories ec
WHERE ec.name = 'core'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_single_leg_bench_get_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 't_stabilization', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'front_carry', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sandbag'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_marching_hip_raise_with_feet_on_a_swiss_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_siff_jump_lunge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'plank_pike_jumps', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_leg_decline_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'calf_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_diamond_push_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'push_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'standing_barbell_calf_raise', ec.id
FROM exercise_categories ec
WHERE ec.name = 'calf_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cable_hammer_curl', ec.id
FROM exercise_categories ec
WHERE ec.name = 'curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_arm_hang_snatch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'olympic_lift'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'good_morning', ec.id
FROM exercise_categories ec
WHERE ec.name = 'leg_curl'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'clams', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_jump_rope_crossover', ec.id
FROM exercise_categories ec
WHERE ec.name = 'cardio'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'lat_pull_down_with_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hyperextension'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bound_seated_single_leg_forward_bend', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_reclining_circle', ec.id
FROM exercise_categories ec
WHERE ec.name = 'sit_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_crossed_arms_crunch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'clam_bridge', ec.id
FROM exercise_categories ec
WHERE ec.name = 'hip_raise'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bound_angle', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pose'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'near_surface', ec.id
FROM exercise_categories ec
WHERE ec.name = 'run_indoor'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'bent_over_reach_to_sky', ec.id
FROM exercise_categories ec
WHERE ec.name = 'warm_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'kettlebell_flye', ec.id
FROM exercise_categories ec
WHERE ec.name = 'flye'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_modified_pilates_roll_up_with_ball', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'weighted_two_point_plank', ec.id
FROM exercise_categories ec
WHERE ec.name = 'plank'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'burpee_pull_up', ec.id
FROM exercise_categories ec
WHERE ec.name = 'pull_up'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'medicine_ball_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'squat'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'floor_climb', ec.id
FROM exercise_categories ec
WHERE ec.name = 'floor_climb'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'cable_row_standing', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'psoas_lunge_stretch', ec.id
FROM exercise_categories ec
WHERE ec.name = 'move'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'swiss_ball_russian_twist', ec.id
FROM exercise_categories ec
WHERE ec.name = 'crunch'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'dumbbell_bulgarian_split_squat', ec.id
FROM exercise_categories ec
WHERE ec.name = 'lunge'
LIMIT 1;

INSERT INTO exercises (name, category_id)
SELECT 'single_arm_inverted_row', ec.id
FROM exercise_categories ec
WHERE ec.name = 'row'
LIMIT 1;

