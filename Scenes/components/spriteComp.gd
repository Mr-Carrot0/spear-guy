extends Sprite2D
class_name SpriteComp

@export var character_body : CharacterBody2D 
#@export var anim_frame_amount := 0 # the amount of frames the animation takes according to the tilemap

#var count := 0.0

#@onready var frame_default := frame

func _process(_delta: float) -> void:
	if character_body:
		if character_body.velocity.x < 0.0:
			flip_h = true
		elif character_body.velocity.x > 0.0:
			flip_h = false

		#if abs(character_body.velocity.x) > 0.0: # if character body is moving, animate it
		#	count += delta 
		#	if count >= 0.1: 
		#		count = 0.0
		#		frame += 1
		#		if frame > frame_default + anim_frame_amount: 
		#			frame = frame_default
		#else:
		#	frame = frame_default 
