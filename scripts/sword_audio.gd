extends AudioStreamPlayer2D

# Placeholder audio system for sword sounds
# Replace these with actual audio files when available

@export var attack1_sound: AudioStream
@export var attack2_sound: AudioStream  
@export var attack3_sound: AudioStream
@export var hit_sound: AudioStream

func play_attack1():
	if attack1_sound:
		stream = attack1_sound
		play()

func play_attack2():
	if attack2_sound:
		stream = attack2_sound
		play()

func play_attack3():
	if attack3_sound:
		stream = attack3_sound
		play()

func play_hit():
	if hit_sound:
		stream = hit_sound
		play()