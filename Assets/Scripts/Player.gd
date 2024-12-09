extends Actor
class_name Player

@onready var _tree: AnimationTree = $AnimationTree

var debug = {
	"main": 0
	,
	"phy": 0
	, "pos": 0
	, "vel": 1
	, "dir": 1,
	"ani": 1
	, "oneshot": 1
	,
}
var old_flip = is_flipped

func _ready():
#	super()
	_tree.active = true
	# _tree["parameters/[OneShot]/request"] = AnimationNodeOneShot.ONE_SHOT_REQUEST_[request]
	
func _physics_process(_delta) -> void:
	super(_delta)
	# for i in [1, 4]:
	# 	if Input.is_action_just_pressed("num_" + str(i)):
	# 		print(i)
	# 		weapon.update_bodies(i)
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jmp_vel

		_tree["parameters/on_ground/transition_request"] = "air"
		_tree["parameters/air/request"] = AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE

	var x_dir = Input.get_axis("move_left", "move_right")
	if x_dir:
		velocity.x = x_dir * speed 
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	if x_dir != 0:
		is_flipped = bool(1 - x_dir)
	# var direction = velocity.normalized()
	if is_flipped != old_flip:
		flip()
		old_flip = is_flipped
	
	## TREE
	# animation_tree["parameters/[Transition]/transition_request"] = "[state]"
	_tree["parameters/on_ground/transition_request"] = ["idle", "walk"][abs(x_dir)]
	
	_tree["parameters/on_ground/transition_request"] = "ground" if is_on_floor() and !Input.is_action_just_pressed("jump") else "air"
	

	if debug.main:
		if debug.phy:
			if debug.pos:
				print("pos: ", position)
			if debug.vel:
				print("vel: ", velocity)
			if debug.dir:
				print("x_dir: ", x_dir)
		if debug.ani:
			if debug.oneshot:
				print(AnimationNodeOneShot[_tree["parameters/spin/request"]])
	
	move_and_slide()
	
	
