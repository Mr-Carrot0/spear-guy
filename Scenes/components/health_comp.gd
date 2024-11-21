extends Node
class_name healthComp 

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
		
func die() -> void:
	pass
	# do something with the body
	#queue_free() 
