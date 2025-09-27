extends Area2D

@export var attack_type: String = "basic"
@export var damage: int = 1

func _ready():
	# Disable monitoring by default
	monitoring = false
	# Only detect mobs
	collision_layer = 0
	collision_mask = 2  # Detect mobs on layer 2

func activate():
	monitoring = true

func deactivate():
	monitoring = false