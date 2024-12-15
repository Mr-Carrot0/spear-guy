extends Node
@onready var text_box: CanvasLayer = $text_box

func _on_text_box_end() -> void:
	get_tree().change_scene_to_file("res://Scenes/marketplace.tscn")
