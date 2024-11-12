extends Node
class_name healthComp #extends RefCounted

# body to be damaged
signal damage_taken
signal death
@export var MAX_HEALTH := 100.0
@export var health := MAX_HEALTH

func take_damage(amount: int):
	health -= amount
	damage_taken.emit()
	
	if (health <= 0):
		death.emit()	
		die()
		# do something with the bodt

func die() -> void:
	queue_free() 
