extends Weapon_wip

@onready var body: Node2D = $body

@export var spacing_global = Vector2(6, -6)
@export var spacing_body = Vector2(6, -6)
var off = Vector2.ZERO

var b_children: Array[Node] # Sprite2D

func _ready():
	super()
	b_children = body.get_children()
	var bcl = len(b_children)
	if bcl != 0:
		for i in range(bcl):
			var pos = off + i * spacing_body
			b_children[i].position = pos
		head.position = spacing_body * (bcl + 1) + off