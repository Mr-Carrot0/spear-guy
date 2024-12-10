extends Node
# should be encapsulated, pls dont set manually
var _player_score: int = 0
signal score_changed(score)

func change_player_score(score: int) -> void:
	_player_score += score
	score_changed.emit(_player_score)

func reset_player_score() -> void:
	_player_score = 0
	score_changed.emit(_player_score)

func reset_game():
	reset_player_score()
	var default_scene_path = ProjectSettings.get_setting("application/run/main_scene")
	get_tree().change_scene_to_file(default_scene_path)

var marketplace: PackedScene
func game_over():
	get_tree().change_scene_to_file("res://Scenes/game_ower.tscn")

	
# https://www.reddit.com/r/godot/comments/17h3o1g/switching_between_scenes_but_keep_the_state/
# https://docs.godotengine.org/en/stable/tutorials/scripting/singletons_autoload.html
# https://docs.godotengine.org/en/stable/classes/class_scenetree.html#class-scenetree-method-change-scene-to-file
