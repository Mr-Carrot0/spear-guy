extends Button
@export var to_scene: PackedScene
@export var texture: Texture2D

func _ready() -> void:
	$Sprite2D.texture = texture
	pressed.connect(_on_pressed)

func _on_pressed():
	$Cross.visible = true
	disabled = true
	get_tree().change_scene_to_packed(to_scene)
