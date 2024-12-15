extends Control

func _ready() -> void:
	$c/quit.pressed.connect(get_tree().quit)
	$c/play.pressed.connect(_start_game)
 
func _start_game():
	get_tree().change_scene_to_file("res://Scenes/intro.tscn")
