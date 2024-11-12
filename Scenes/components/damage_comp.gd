extends Area2D
class_name damageComp

@export var damage: int = 100

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.damage(damage)
