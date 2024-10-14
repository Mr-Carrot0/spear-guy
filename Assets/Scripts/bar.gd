extends ColorRect
class_name Bar
# @export_category("test")
@export var max_size: Vector2
@export var whysf = Vector2(0, -20)

func _ready():
	size = max_size
	position = whysf

func update(newSize = false):
	if newSize != false:
		size.x = newSize
	position.x = (max_size.x - 2 * size.x) / 2 + whysf.x


func _physics_process(_delta):
	# if size.x > 0:
	# 	size.x -= 1
	update()