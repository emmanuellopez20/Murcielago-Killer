extends Node2D

signal enemy_killed(enemy)
signal attack_finished

enum AttackState {
	IDLE,
	ATTACK_1,
	ATTACK_2,
	ATTACK_3,
	COOLDOWN
}

@export var combo_window_time: float = 1.0
@export var attack_duration: float = 0.3
@export var cooldown_time: float = 0.5

var current_state: AttackState = AttackState.IDLE
var combo_count: int = 0
var combo_timer: Timer
var attack_timer: Timer
var cooldown_timer: Timer

@onready var sword_sprite: AnimatedSprite2D = $SwordSprite
@onready var attack1_area: Area2D = $AttackAreas/Attack1Area
@onready var attack2_area: Area2D = $AttackAreas/Attack2Area
@onready var attack3_area: Area2D = $AttackAreas/Attack3Area

func _ready():
	# Setup timers
	combo_timer = Timer.new()
	combo_timer.wait_time = combo_window_time
	combo_timer.one_shot = true
	combo_timer.timeout.connect(_on_combo_timeout)
	add_child(combo_timer)
	
	attack_timer = Timer.new()
	attack_timer.wait_time = attack_duration
	attack_timer.one_shot = true
	attack_timer.timeout.connect(_on_attack_finished)
	add_child(attack_timer)
	
	cooldown_timer = Timer.new()
	cooldown_timer.wait_time = cooldown_time
	cooldown_timer.one_shot = true
	cooldown_timer.timeout.connect(_on_cooldown_finished)
	add_child(cooldown_timer)
	
	# Connect attack areas
	attack1_area.body_entered.connect(_on_attack_hit)
	attack2_area.body_entered.connect(_on_attack_hit)
	attack3_area.body_entered.connect(_on_attack_hit)
	
	# Initially disable all attack areas
	_disable_all_attack_areas()

func can_attack() -> bool:
	return current_state == AttackState.IDLE

func try_attack():
	if current_state == AttackState.COOLDOWN:
		return
	
	# If we're in idle state or combo window is active
	if current_state == AttackState.IDLE:
		combo_count += 1
		
		match combo_count:
			1:
				_execute_attack_1()
			2:
				_execute_attack_2()
			3:
				_execute_attack_3()
			_:
				combo_count = 1
				_execute_attack_1()

func _execute_attack_1():
	current_state = AttackState.ATTACK_1
	sword_sprite.play("attack1")
	attack1_area.set_deferred("monitoring", true)
	print("Attack 1 - Area monitoring enabled: ", attack1_area.monitoring)
	attack_timer.start()
	
	# Play sound effect
	_play_attack_sound(1)
	
	# Start combo window for next attack
	combo_timer.start()

func _execute_attack_2():
	current_state = AttackState.ATTACK_2
	sword_sprite.play("attack2")
	attack2_area.set_deferred("monitoring", true)
	print("Attack 2 - Area monitoring enabled: ", attack2_area.monitoring)
	attack_timer.start()
	
	# Play sound effect
	_play_attack_sound(2)
	
	# Start combo window for next attack
	combo_timer.start()

func _execute_attack_3():
	current_state = AttackState.ATTACK_3
	sword_sprite.play("attack3")
	attack3_area.set_deferred("monitoring", true)
	print("Attack 3 - Area monitoring enabled: ", attack3_area.monitoring)
	attack_timer.start()
	
	# Play sound effect
	_play_attack_sound(3)
	
	# No combo window after attack 3, go to cooldown
	combo_timer.stop()

func _play_attack_sound(attack_number: int):
	# Placeholder for sound effects
	# You can add AudioStreamPlayer2D here later
	print("Playing attack ", attack_number, " sound")

func _on_attack_finished():
	_disable_all_attack_areas()
	
	if current_state == AttackState.ATTACK_3:
		# After attack 3, go to cooldown
		current_state = AttackState.COOLDOWN
		cooldown_timer.start()
		combo_count = 0
	else:
		# Return to idle, but keep combo window active
		current_state = AttackState.IDLE
	
	sword_sprite.play("idle")
	
	# Emit signal to notify player that attack is finished
	attack_finished.emit()

func _on_combo_timeout():
	# Combo window expired, reset combo
	combo_count = 0
	current_state = AttackState.IDLE

func _on_cooldown_finished():
	current_state = AttackState.IDLE
	combo_count = 0
	
	# Emit signal to notify player that cooldown is finished
	attack_finished.emit()

func _disable_all_attack_areas():
	attack1_area.set_deferred("monitoring", false)
	attack2_area.set_deferred("monitoring", false)
	attack3_area.set_deferred("monitoring", false)

func _on_attack_hit(body):
	print("Attack hit detected on: ", body.name, " - Groups: ", body.get_groups())
	if body.is_in_group("mobs"):
		print("Killing mob: ", body.name)
		body.die_by_sword()
		enemy_killed.emit(body)
	else:
		print("Body is not in mobs group")

func reset():
	current_state = AttackState.IDLE
	combo_count = 0
	combo_timer.stop()
	attack_timer.stop()
	cooldown_timer.stop()
	_disable_all_attack_areas()
	sword_sprite.play("idle")