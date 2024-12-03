extends RigidBody2D

#func _ready():
	#rotation = deg_to_rad(randf_range(-10, 10)) 

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Actor:  
		var direction = (global_position.x - body.global_position.x)
		direction = direction / abs(direction)  
		apply_central_impulse(Vector2(direction * 10, 0)) 
