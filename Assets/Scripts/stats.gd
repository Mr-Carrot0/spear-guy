extends CanvasLayer

@onready var score_display: Label = $score_display
@onready var hearths: TextureRect = $hearths

var current_score: int = 0

func _ready() -> void:
	current_score = Globals._player_score
	change_text(current_score)
	Globals.score_changed.connect(display_score)
	
	display_extra_life(Globals._player_extra_live)
	Globals.extra_life_changed.connect(display_extra_life)

func display_score(score:int ):
	var tween = create_tween()
	tween.tween_method(change_text,current_score, score, 2.0)
	current_score = score
	
func change_text(score: int):
	score_display.text =  "Score: " + str(score)
	

func display_extra_life(life:int ):
	print(life)
	const hearth_width = 16
	hearths.size.x = hearth_width * life
	
	
