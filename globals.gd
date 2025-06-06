extends Node

var player_score: int = 0:
	set(new_value):
		player_score = new_value
		score_changed.emit(player_score)
	get():
		return player_score

signal score_changed(score: int)

const INITIAL_EXTRA_LIFE_C = 3
var player_extra_live: int = INITIAL_EXTRA_LIFE_C:
	set(new_value):
		player_extra_live = new_value
		extra_life_changed.emit(player_extra_live)
		
signal extra_life_changed(life: int)

func reset_player_score() -> void:
	player_score = 0

func reset_player_extra_life() -> void:
	player_extra_live = INITIAL_EXTRA_LIFE_C


func reset_game():
	reset_player_score()
	reset_player_extra_life()
	#var default_scene_path = ProjectSettings.get_setting("application/run/main_scene")
	get_tree().change_scene_to_file("res://Scenes/marketplace.tscn")

var marketplace: PackedScene
func game_over():
	get_tree().change_scene_to_file("res://Scenes/game_ower.tscn")

func play_sound(sound: String, volume_db:float=0):
	var player = AudioStreamPlayer.new()
	player.stream = load(sound)
	player.volume_db = volume_db
	player.finished.connect(player.queue_free)
	add_child(player) 
	player.play()
	
	
# https://www.reddit.com/r/godot/comments/17h3o1g/switching_between_scenes_but_keep_the_state/
# https://docs.godotengine.org/en/stable/tutorials/scripting/singletons_autoload.html
# https://docs.godotengine.org/en/stable/classes/class_scenetree.html#class-scenetree-method-change-scene-to-file
