extends Polygon2D
class_name healthBarComp

@export var hComp: healthComp
@onready var max_width = hComp.MAX_HEALTH
var healthy_color: Color = Color.GREEN
var damaged_color: Color = Color.DARK_RED

func _ready() -> void:
	draw()
	hComp.damage_taken.connect(draw)

func draw():
	var width = hComp.health 
	var proportion = width / max_width
	scale.x = proportion
	if proportion < 0.5:
		color = damaged_color
	else:
		color = healthy_color
	
	
	
	
	

	
