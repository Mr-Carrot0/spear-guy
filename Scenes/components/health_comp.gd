# This should if better designed be responsible for applying the damaged
# Not the damage component

# take inspiration from https://github.com/cluttered-code/godot-health-hitbox-hurtbox/blob/main/addons/health_hitbox_hurtbox/health/health.gd

extends Node
class_name healthComp 

@export var body: Node2D
signal damage_taken
signal death
@export var MAX_HEALTH := 100.0
@onready var health := MAX_HEALTH
@export var score_worth: int = 100


func take_damage(amount: int):
	if health < amount:
		health = 0
	else: 
		health -= amount
	damage_taken.emit()
	
	# this is bad code but it works
	if health <= 0:
		if body is not Player:
			death.emit()
			die()
		else:
			Globals.change_player_extra_life(-1)
			if Globals._player_extra_live <= 0:
				death.emit()	
				die()
			else:
				get_tree().call_deferred("reload_current_scene")
				
		
func die() -> void:
	if body is Player:
		# lose
		Globals.play_sound("res://Assets/Audio/losetrumpet.mp3")
		Globals.game_over.call_deferred()
	elif body is Boss:
		# win
		Globals.change_player_score(score_worth)
		Globals.play_sound("res://Assets/Audio/winfretless.ogg")
		Globals.game_over.call_deferred()
	else:
		
		Globals.change_player_score(score_worth)
		body.queue_free()
