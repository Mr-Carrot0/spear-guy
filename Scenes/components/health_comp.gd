# This should if better designed be responsible for applying the damaged
# Not the damage component
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
	
	if health <= 0:
		death.emit()	
		die()
		
func die() -> void:
	if body is Player:

		#get_tree().call_deferred("reload_current_scene")
		Globals.game_over.call_deferred()
	else:

		Globals.change_player_score(score_worth)
		body.queue_free()
