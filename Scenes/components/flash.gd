extends Node
class_name Flash

@export var duration: float = 0.2
@export var flash_color: Color = Color.WHITE #Color.hex(0xac3232ff)

@export var target_node: Node2D
@export var health:healthComp

var flash_material: ShaderMaterial 


func _ready() -> void:
	flash_material = ShaderMaterial.new()
	flash_material.shader = preload("res://Assets/shaders/flash.gdshader")  

	if !target_node:
		target_node = get_tree().current_scene
		
	health.damage_taken.connect(on_damage_taken)

func on_damage_taken():
	if target_node:
		apply_flash(target_node, flash_color)
		await get_tree().create_timer(duration).timeout
		clear_flash(target_node)


# it would probably be more performant to only have a uniform that we change instead of the full material
func apply_flash(node: Node2D, color: Color):
	node.material = flash_material
	flash_material.set_shader_parameter("flash_color", color)  

func clear_flash(node: Node2D):
	node.material = null  
