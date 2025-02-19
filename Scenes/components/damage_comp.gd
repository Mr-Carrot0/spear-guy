# TOOD rework this to also work as a healingComponent
# for now I will try to use it as healing by applying negative damage but that is very uggly and we will also need to change 
# the healtComponent
extends Area2D
class_name damageComp

@export var damage_amount: int = 100
@export var knockback = true

signal hit

signal inflicted  # damage or healing

func _ready() -> void:
	body_entered.connect(try_damage)
	area_entered.connect(try_damage)

func try_damage(body_a: Node2D) -> void:
	
	if body_a.has_node("healthComp"):
		if body_a is Actor && knockback:
			body_a.knockback()
		
		var health_node = body_a.get_node("healthComp")
		if health_node.has_method("take_damage"):
			health_node.take_damage(damage_amount)  
			inflicted.emit()
	# basically only for the icicle
	hit.emit()
		
