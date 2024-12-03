extends Weapon
class_name ____

func _ready():
	spacing_body = Vector2i(6, -6) # insert custom spacing
	super()

func _process(_delta):
	super(_delta)