extends Actor
class_name Player
@onready var _tree: AnimationTree = $AnimationTree

var is_flipped = false

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



func _ready():
	_tree.active = true
	
func _physics_process(delta) -> void:

	super(delta)
		
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jmp_vel

		_tree["parameters/m/transition_request"] = "air"
		# _tree["parameters/[OneShot]/request"] = AnimationNodeOneShot.ONE_SHOT_REQUEST_\request\
		_tree["parameters/spin/request"] = AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE

	var x_dir = Input.get_axis("move_left", "move_right")
	
	velocity.x = x_dir * speed if x_dir else move_toward(velocity.x, 0, speed)

	if x_dir != 0:
		is_flipped = bool(1 - x_dir)
	# var direction = velocity.normalized()
	
	sprite.flip_h = is_flipped
	sprite.offset.x = [0, -3][int(is_flipped)]
	
	## TREE
	# animation_tree["parameters/[Transition]/transition_request"] = "\state\"
	_tree["parameters/on_ground/transition_request"] = ["idle", "walk"][abs(x_dir)]

	# if is_on_floor() and !Input.is_action_just_pressed("jump"):
	# 	_tree["parameters/m/transition_request"] = "ground"
	# else:
	# 	_tree["parameters/m/transition_request"] = "air"
	
	_tree["parameters/m/transition_request"] = "ground" if is_on_floor() and !Input.is_action_just_pressed("jump") else "air"
	

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
	
	
