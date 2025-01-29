extends Node2D
@export var strength: int = 400

func _on_jumpad_body_entered(body: Node2D) -> void:
	if body is Player:
		body.velocity = -(Vector2(0,strength))
		
