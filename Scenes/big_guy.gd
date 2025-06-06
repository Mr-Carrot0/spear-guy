# Not used, have to understand animation tree first
# See big_guy_temp.gd 
# for the script in use

extends AnimationTree

func set_condition(condition_name, value):
	set("parameters/conditions/" + condition_name, value)

@onready var timer: Timer = $"../Timer"

const attacks = ["attack", "d_attack" ]

func _ready():
	set("parameters/conditions/attack", true)
	#set_condition("attack", true)
	#timer.timeout.connect(_on_timer_timeout)
	#start_random_timer()
#
func start_random_timer():
	timer.wait_time = randf_range(2.0, 5.0) 
	timer.start()

func _on_timer_timeout():
	var next_attack = attacks[randi() % attacks.size()]
	set_condition(next_attack, true)
	start_random_timer()
	
