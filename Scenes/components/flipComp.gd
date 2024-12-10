extends Node
class_name flipComp

@export var old_flip = false

@export var body: CharacterBody2D

func _physics_process(_delta: float) -> void:
	if body:
		set_flip(body.velocity.x < 0)

func set_flip(value: bool):
	if value != old_flip:
		flip()
		old_flip = value
		
func flip():
	body.scale.x = -1
	
#set_flip(true)
#set_flip(false)
