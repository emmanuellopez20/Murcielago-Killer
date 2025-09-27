extends RigidBody2D

@export var death_effect_scene: PackedScene
var is_dying: bool = false

func _ready():
	var mob_types = Array($AnimatedSprite2D.sprite_frames.get_animation_names())
	$AnimatedSprite2D.animation = mob_types.pick_random()
	$AnimatedSprite2D.play()

func die_by_sword():
	print("die_by_sword called on: ", name)
	if is_dying:
		print("Already dying, returning")
		return
	
	is_dying = true
	print("Starting death sequence for: ", name)
	
	# Create death effect
	_create_death_effect()
	
	# Remove from mobs group
	remove_from_group("mobs")
	
	# Disable collision
	$CollisionShape2D.set_deferred("disabled", true)
	
	# Play death animation or hide immediately
	$AnimatedSprite2D.modulate = Color.RED
	
	# Create a tween for death effect
	var tween = create_tween()
	tween.parallel().tween_property($AnimatedSprite2D, "modulate:a", 0.0, 0.3)
	tween.parallel().tween_property($AnimatedSprite2D, "scale", Vector2(1.5, 1.5), 0.3)
	tween.tween_callback(queue_free)

func _create_death_effect():
	# Simple particle effect for death
	var particles = preload("res://scenes/death_particles.tscn")
	if particles:
		var effect = particles.instantiate()
		get_parent().add_child(effect)
		effect.global_position = global_position
		effect.emitting = true

func _on_VisibilityNotifier2D_screen_exited():
	if not is_dying:
		queue_free()
