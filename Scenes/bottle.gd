extends RigidBody2D

const strength = 4
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Actor:  
		var direction = (global_position.x - body.global_position.x)
		direction = direction / abs(direction)  
		apply_central_impulse(Vector2(direction * strength, 0)) 
