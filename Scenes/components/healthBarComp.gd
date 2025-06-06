extends Polygon2D
class_name healthBarComp

#  I could have used the already existing node...
# Did not know that it existed

@export var hComp: healthComp
@onready var max_width = hComp.MAX_HEALTH
var healthy_color: Color = Color.hex(0x99e550ff)
var damaged_color: Color = Color.hex(0xac3232ff)


func _ready() -> void:
	scale.x = 0.5
	draw()
	hComp.damage_taken.connect(draw)

func draw():
	var width = hComp.health
	if  width < 0:
		width = 0
	var proportion = width / max_width
	scale.x = proportion
	if proportion < 0.5:
		color = damaged_color
	else:
		color = healthy_color
	
	
