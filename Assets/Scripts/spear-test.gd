extends Node2D

var sprites = {
	"butt": $butt,
	"body": $body,
	"head": $head
}

func rotate_vec(vec:Vector2):
	vec = new Vector2()

var i = 0

func _ready():
	for sprite in sprites:
		sprite.position = [Vector2(0, 0), Vector2(6, -6), Vector2(11, -11)][i]
		i += 1
	i = 0

func _update():
	pass
	
	

func _process(_delta):
	_update()
	rotate(0.1)