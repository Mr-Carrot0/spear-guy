# this is temporary untill I understand animationTree
# there should be smoother transitions

extends Node

@onready var anim = $AnimationPlayer
@onready var timer = $Timer

var attack_animations = ["attack", "double_attack"]

func start_attack_timer():
	timer.wait_time = randf_range(2.0, 5.0)
	timer.start()

func _ready():
	
	pass
	#anim.play("idle")
	#timer.wait_time = randf_range(2.0, 5.0)  
	#timer.timeout.connect(_on_timer_timeout)
	#start_attack_timer()

func _on_timer_timeout():
	anim.play(attack_animations.pick_random())
	await anim.animation_finished
	anim.play("idle")
	
	start_attack_timer()
