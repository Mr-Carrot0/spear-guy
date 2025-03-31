# this is temporary untill I understand animationTree
# there should be smoother transitions

extends Node
class_name BigGuy

@onready var anim = $AnimationPlayer
@onready var timer = $Timer

@onready var health_comp: healthComp = %healthComp

var attack_animations = ["attack", "double_attack"]

signal defeat

var dead = false

func start_attack_timer():
	timer.wait_time = randf_range(2.0, 5.0)
	timer.start()

func disable_all_collision(node: Node):
	if node is CollisionShape2D:
		node.call_deferred("set_disabled", true)
	for child in node.get_children():
		disable_all_collision(child)

func _on_die():
	dead = true
	anim.play("die")
	disable_all_collision(self)
	await anim.animation_finished
	defeat.emit()
	queue_free()

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
