extends CharacterBody2D

@export_range(-1.0, 1.0, 2.0) var dir := 1.0
@export var speed := 1000.0

@export var fall_ray: RayCast2D

func _physics_process(delta: float) -> void:
	
		velocity.x = speed * delta * dir 
		
		if !is_on_floor(): 
			velocity += get_gravity() * delta
			
		# only move if there is ground ahead
		if !fall_ray.is_colliding():
			velocity.x = 0
				
			
		move_and_slide() 
		
		if is_on_wall(): 
			reverse_dir()
			print("wall ", dir)
			
		
func  reverse_dir() -> void:
		dir *= -1.0
	
