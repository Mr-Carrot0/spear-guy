extends Node
class_name MovementComp

@export var character_body : CharacterBody2D 
@export_range(-1.0, 1.0, 2.0) var dir := 1.0
@export_range(500.0, 2000.0, 100.0) var speed := 1000.0
@export var gravity: bool = true

func _physics_process(delta: float) -> void:
	
	if character_body: 
		if gravity and not character_body.is_on_floor(): 
			character_body.velocity += character_body.get_gravity() * delta
			
		character_body.velocity.x = speed * delta * dir 
		character_body.move_and_slide() 
		
		if character_body.is_on_wall(): 
			dir *= -1.0
		
