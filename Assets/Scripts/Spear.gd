extends Weapon
class_name Spear

# var off2: Vector2

func _ready():
	super()
	# for i in range(body_count):
	# 	var tmp = Sprite2D.new()
	# 	tmp.texture = body_img
	# 	tmp.position = i * spacing_body # add Vector2 constructor if error

	# 	body.add_child(tmp)
		
	# head.position = spacing_body * (body_count + 1) # add Vector2 constructor if error
	# colshape.shape.b += Vector2(spacing_body * (body_count - 1)) 
# 	print()
# 	off = spacing_body * (body_count + 1)
# 	# print("off: ",off)
# 	__add_bodies(body_count)
# 	colshape.shape.b = Vector2(off)

func _process(_delta):
	super(_delta)
# 	# if Input.is_action_just_pressed("test"):
# 	# 	__add_bodies(1)

# func __add_bodies(n: int):
# 	var bl := len(bodies)
# 	for j in range(n):
# 		var tot = bl + j
# 		var tmp = Sprite2D.new()

# 		tmp.texture = body_img
# 		bodies.append(tmp)
# 		body.add_child(tmp)

# 		bodies[-1].position = Vector2(tot * spacing_body)
	
# 	var off2 := Vector2(off)
# 	colshape.shape.b += off2
# 	head.position = off2

# func update_bodies(new_body_count: int) -> void:
# 	if new_body_count != body_count:
# 		var diff: int = new_body_count - body_count
	
# 		off = Vector2(spacing_body * (new_body_count + 1))
# 		body_count = new_body_count

# 		if diff < 0: # remove bodies
# 			for i in range(1, 1 - diff):
# 				bodies[-i].queue_free()
# 				bodies.resize(bodies.size() - 1)
# 				# bodies.remove_at(-i)
# 				head.position = off
# 		else: # add bodies
# 			__add_bodies(diff)
			
# func _print_self()->void:
# 	print(JSON.stringify({
# 			'colshape': colshape,
# 			'off': off,
# 			'h_pos': head.position,
# 			# 'b': off,
# 			# 'c': off,
# 			# 'd': off,
# 			},"\t"))