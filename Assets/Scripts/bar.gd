extends Polygon2D
class_name Bar

@onready var parent = get_parent()

func _ready():
	parent.connect("health_update", changeSize)

func changeSize(size):
	scale.x = size
