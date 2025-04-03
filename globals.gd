extends Node
# should be encapsulated, pls dont set manually
var _player_score: int = 0
signal score_changed(score: int)

const INITIAL_EXTRA_LIFE_C = 3
var _player_extra_live: int = INITIAL_EXTRA_LIFE_C
signal extra_life_changed(life: int)

func change_player_score(score: int) -> void:
	_player_score += score
	score_changed.emit(_player_score)

func reset_player_score() -> void:
	_player_score = 0
	score_changed.emit(_player_score)
	
func change_player_extra_life(life: int) -> void:
	_player_extra_live += life
	extra_life_changed.emit(_player_extra_live)

func reset_player_extra_life() -> void:
	_player_extra_live = INITIAL_EXTRA_LIFE_C
	extra_life_changed.emit(_player_extra_live)

func reset_game():
	reset_player_score()
	reset_player_extra_life()
	# var default_scene_path = ProjectSettings.get_setting("application/run/main_scene")
	get_tree().change_scene_to_file("res://Scenes/marketplace.tscn")

var marketplace: PackedScene
func game_over():
	get_tree().change_scene_to_file("res://Scenes/game_ower.tscn")

func play_sound(sound: String):
	var player = AudioStreamPlayer.new()
	player.stream = load(sound)
	player.finished.connect(player.queue_free)
	add_child(player)
	player.play()
	
# Utilities

# useful for direction deternimation. 
# Move it back to res://Assets/Scripts/boss_revamp.gd 
# if it goes unused elsewhere.
func bool_to_i8(b: bool) -> int:
	return 1 if b else -1

# https://www.reddit.com/r/godot/comments/17h3o1g/switching_between_scenes_but_keep_the_state/
# https://docs.godotengine.org/en/stable/tutorials/scripting/singletons_autoload.html
# https://docs.godotengine.org/en/stable/classes/class_scenetree.html#class-scenetree-method-change-scene-to-file
