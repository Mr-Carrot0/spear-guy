extends Node2D

@onready var butt = $butt
@onready var head = $head
@onready var body = $head

var i = 0

func _ready():
	print_debug("butt:",butt.position,"\n","butt:",butt.position,"\n","butt:",butt.position,"\n")
