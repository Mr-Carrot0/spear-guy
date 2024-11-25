extends Area2D
class_name damageComp

@export var damage_amount: int = 100
@export var knockback = true

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body.has_node("healthComp"):
		if body is Actor && knockback:
			body.knockback()
		
		var health_node = body.get_node("healthComp")
		if health_node.has_method("take_damage"):
			health_node.take_damage(damage_amount)  
		
