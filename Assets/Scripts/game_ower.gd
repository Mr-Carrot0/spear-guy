extends Control

func _ready() -> void:
	$c/score.text = "You got: " + str(Globals.player_score)
	$c/quit.pressed.connect(get_tree().quit)
	$c/play.pressed.connect(Globals.reset_game)
 
