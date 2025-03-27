# this is temporary untill I understand animationTree
# there should be smoother transitions

extends Node
class_name BigGuy

@onready var anim = $AnimationPlayer
@onready var timer = $Timer

@onready var health_comp: healthComp = %healthComp

var attack_animations = ["attack", "double_attack"]

var dead = false

func start_attack_timer():
	timer.wait_time = randf_range(2.0, 5.0)
	timer.start()

func _on_die():
	dead = true
	anim.play("die")

func _ready():
	health_comp.death.connect(_on_die)
	anim.play("idle")
	timer.wait_time = randf_range(2.0, 5.0)  
	timer.timeout.connect(_on_timer_timeout)
	start_attack_timer()

func _on_timer_timeout():
	if !dead:
		anim.play(attack_animations.pick_random())
		await anim.animation_finished
		anim.play("idle")
	
		start_attack_timer()
