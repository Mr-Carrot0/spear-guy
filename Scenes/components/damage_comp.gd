extends Area2D
class_name damageComp

@export var damage_amount: int = 100

func _on_body_entered(body: Node2D) -> void:
	if body.has_node("healthComp"):
		var health_node = body.get_node("healthComp")
		if health_node.has_method("take_damage"):
			health_node.take_damage(damage_amount)  
