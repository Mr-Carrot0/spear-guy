extends Weapon
class_name Spear

@onready var body: Node2D = $body # get_node(NodePath(names.body_name))
@onready var hurt_col_b: Vector2 = $hurtbox/CollisionShape2D.shape.b

@export_category("body")
@export var body_count := 1
@export var body_img: Texture2D = preload("res://Assets/Sprites/spear-destruction-body.png")
var bodies: Array[Sprite2D] = []

@export_category("vec")
@export var spacing_body = Vector2i(6, -6)
var off

func _ready():
	super()
	off = spacing_body * (body_count + 1)
	__add_bodies(body_count)

func __add_bodies(n: int):
	var bl = len(bodies)
	for j in range(n):
		var tot = bl + j
		bodies.append(Sprite2D.new())
		bodies[tot].texture = body_img
		body.add_child(bodies[tot])

		bodies[tot].position = tot * spacing_body
			
	hurt_col_b += off
	head.position = off

func update_bodies(new_body_count: int) -> void:
	if new_body_count != body_count:
		var diff: int = new_body_count - body_count
	
		off = Vector2(spacing_body * (new_body_count + 1))
		body_count = new_body_count

		if diff < 0: # remove bodies
			for i in range(1, 1 - diff):
				bodies[-i].queue_free()
				head.position = off
		else: # add bodies
			__add_bodies(diff)
