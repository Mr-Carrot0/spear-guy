extends Node2D

@onready var butt = $butt
@onready var body = $body
@onready var head = $head

var spacing_global = Vector2(5,-5)
var off = Vector2(1,-1)

var b_children: Array[Node] # Sprite2D

var i = 0

func _ready():
	# print("butt:", butt.position, "\n", "body:", body.position, "\n", "head:", head.position)
	b_children = body.get_children()
