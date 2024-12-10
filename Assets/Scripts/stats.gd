extends CanvasLayer

@onready var score_display: Label = $score_display

var current_score: int = 0

func _ready() -> void:
	current_score = Globals._player_score
	change_text(current_score)
	Globals.score_changed.connect(display_score)

func display_score(score:int ):
	var tween = create_tween()
	tween.tween_method(change_text,current_score, score, 2.0)
	current_score = score
	
func change_text(score: int):
	score_display.text =  "Score: " + str(score)
	
