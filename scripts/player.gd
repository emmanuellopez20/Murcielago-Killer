extends Area2D

signal hit

enum PlayerState {
	NORMAL,
	ATTACKING
}

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
var current_state: PlayerState = PlayerState.NORMAL

@onready var sword_system: Node2D = $SwordSystem

func _ready():
	screen_size = get_viewport_rect().size
	hide()
	
	# Connect sword system signals
	if sword_system:
		sword_system.enemy_killed.connect(_on_enemy_killed)
		sword_system.attack_finished.connect(_on_sword_attack_finished)

func _process(delta):
	# Handle attack input
	if Input.is_action_just_pressed(&"attack"):
		if sword_system and sword_system.can_attack():
			sword_system.try_attack()
			current_state = PlayerState.ATTACKING
	
	# Handle movement
	var velocity = Vector2.ZERO # The player's movement vector.
	var movement_speed = speed
	
	# Reduce movement speed during attacks
	if current_state == PlayerState.ATTACKING:
		movement_speed *= 0.3
	
	if Input.is_action_pressed(&"move_right"):
		velocity.x += 1
	if Input.is_action_pressed(&"move_left"):
		velocity.x -= 1
	if Input.is_action_pressed(&"move_down"):
		velocity.y += 1
	if Input.is_action_pressed(&"move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * movement_speed
		if current_state == PlayerState.NORMAL:
			$AnimatedSprite2D.play()
	else:
		if current_state == PlayerState.NORMAL:
			$AnimatedSprite2D.stop()

	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)

	# Update sprite direction (only when not attacking)
	if current_state == PlayerState.NORMAL:
		if velocity.x != 0:
			$AnimatedSprite2D.animation = &"right"
			$AnimatedSprite2D.flip_v = false
			$AnimatedSprite2D.flip_h = velocity.x < 0
			$Trail.rotation = 0
			
			# Update sword direction
			if sword_system:
				sword_system.scale.x = -1 if velocity.x < 0 else 1
		elif velocity.y != 0:
			$AnimatedSprite2D.animation = &"up"
			$AnimatedSprite2D.flip_v = velocity.y > 0
			$AnimatedSprite2D.flip_h = false

func start(pos):
	position = pos
	rotation = 0
	current_state = PlayerState.NORMAL
	show()
	$CollisionShape2D.disabled = false
	
	# Reset sprite orientation
	$AnimatedSprite2D.flip_v = false
	$AnimatedSprite2D.flip_h = false
	
	# Reset sword system
	if sword_system:
		sword_system.reset()

func _on_body_entered(_body):
	hide() # Player disappears after being hit.
	hit.emit()
	# Must be deferred as we can't change physics properties on a physics callback.
	$CollisionShape2D.set_deferred(&"disabled", true)

func _on_enemy_killed(_enemy):
	# Handle enemy killed by sword (could add score, effects, etc.)
	print("Enemy killed by sword!")

func _on_sword_attack_finished():
	# Return to normal state when attack is finished
	current_state = PlayerState.NORMAL
