extends Resource
class_name SwordConfig

# Timing configuration
@export var combo_window_time: float = 1.2
@export var attack1_duration: float = 0.25
@export var attack2_duration: float = 0.35
@export var attack3_duration: float = 0.5
@export var cooldown_time: float = 0.8

# Movement configuration
@export var attack_movement_penalty: float = 0.3

# Attack areas configuration
@export var attack1_size: Vector2 = Vector2(60, 20)
@export var attack1_offset: Vector2 = Vector2(40, 0)

@export var attack2_size: Vector2 = Vector2(80, 40)
@export var attack2_offset: Vector2 = Vector2(35, 0)

@export var attack3_radius: float = 50.0
@export var attack3_offset: Vector2 = Vector2(0, 0)

# Visual effects
@export var death_effect_duration: float = 0.3
@export var death_scale_multiplier: float = 1.5