extends Node
class_name healthComp 

@export var body: Node2D
signal damage_taken
signal death
@export var MAX_HEALTH := 100.0
@onready var health := MAX_HEALTH

func _ready() -> void:
	print(health)

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
		pass
	else:
		body.queue_free()
