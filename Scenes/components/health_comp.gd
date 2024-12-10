extends Node
class_name healthComp 

@export var body: Node2D
signal damage_taken
signal death
@export var MAX_HEALTH := 100.0
@onready var health := MAX_HEALTH

func _ready() -> void:pass
	# print(health)

func take_damage(amount: int):
	health -= amount
	damage_taken.emit()
	
	if (health <= 0):
		death.emit()	
		die()
		
func die() -> void:
	if body is Player:
		pass
	else:
		body.queue_free()
