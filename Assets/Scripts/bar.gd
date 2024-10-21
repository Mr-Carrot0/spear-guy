extends Polygon2D
class_name Bar

@onready var parent = get_parent()

var init_pos = position

func _ready():
	parent.connect("health_update", changeSize)

func changeSize(size):
	size = size if size > 0 else 0
	scale.x = size / 20
	position.x = (init_pos.x - size/2) / 2
