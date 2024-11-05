extends Weapon
class_name Spear

@onready var body: Node2D = $body

@export_category("body")
@export var body_count := 1
@export var body_img: Texture2D = preload("res://Assets/Sprites/spear-destruction-body.png")
var bodies: Array[Sprite2D] = []

@export_category("vec")
@export var spacing_global = Vector2i(6, -6)
@export var spacing_body = Vector2i(6, -6)
var off = Vector2i.ZERO

func _ready():
	
	# super()
	for i in range(body_count):
		bodies.append(Sprite2D.new())
		bodies[i].texture = body_img
		body.add_child(bodies[i])
	var bcl = len(bodies)
	if bcl != 0:
		for i in range(bcl):
			var pos = off + i * spacing_body
			bodies[i].position = pos
		head.position = spacing_body * (bcl + 1) + off