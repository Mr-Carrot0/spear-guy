# This should if better designed be responsible for applying the damaged
# Not the damage component

# take inspiration from https://github.com/cluttered-code/godot-health-hitbox-hurtbox/blob/main/addons/health_hitbox_hurtbox/health/health.gd

extends Node
class_name healthComp 

@export var body: Node
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
			Globals.player_extra_live -= 1
			if Globals.player_extra_live <= 0:
				death.emit()	
				die()
			else:
				get_tree().call_deferred("reload_current_scene")
				
		
func die() -> void:
	if body is Player:
		# lose
		Globals.play_sound("res://Assets/Audio/losetrumpet.mp3", 10.0)
		Globals.game_over.call_deferred()
	elif body is Boss:
		# win
		Globals.player_score += score_worth
		Globals.play_sound("res://Assets/Audio/winfretless.ogg", 10.0)
		Globals.game_over.call_deferred()
	elif body is BigGuy:
		Globals.player_score += 200
		
	else:
		
		Globals.player_score += score_worth
		body.queue_free()
