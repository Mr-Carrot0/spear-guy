extends Node
class_name Flash

@export var duration: float = 0.1
@export var tint_color: Color = Color(1, 0, 0, 1.0)

@export var target_node: Node2D
@export var healthComp:healthComp

func _ready():
	if !target_node:
		target_node = get_tree().current_scene
	healthComp.damage_taken.connect(apply_tint)

func apply_tint():
	if target_node:
		
		target_node.modulate = tint_color
		await get_tree().create_timer(duration).timeout
		 # Reset to default
		target_node.modulate = Color(1, 1, 1, 1) 
