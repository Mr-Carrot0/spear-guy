extends CharacterBody2D
# https://github.com/godotengine/godot/issues/12335
# https://forum.godotengine.org/t/best-way-to-flip-a-character-and-all-of-its-collisions-areas-2d/19464/2
# func _process(delta: float) -> void:
# 	var direction = velocity.normalized().x
# 	velocity.normalized()
# 	scale.x = scale.y * direction
