extends Actor

@onready var _tree: AnimationTree = $AnimationTree

const SPEED := 5000.0
const JUMP_VELOCITY := -150.0

var is_flipped = false

var debug = {
	"main": 1,
	"phy": 0
	, "pos": 0
	, "vel": 1
	, "dir": 1
}

func _ready():
	_tree.active = true
	

func _physics_process(delta) -> void:
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

		_tree["parameters/m/transition_request"] = "air"
		# _tree["parameters/in_air/transition_request"] = "jump"

	var x_dir = Input.get_axis("move_left", "move_right")
	velocity.x = x_dir * SPEED * delta if x_dir else move_toward(velocity.x, 0, SPEED * delta)

	if x_dir != 0:
		is_flipped = bool(1 - x_dir)
	# var direction = velocity.normalized()
	
	sprite.flip_h = is_flipped
	sprite.offset.x = [0, -3][int(is_flipped)]

	## TREE
	# animation_tree["parameters/Transition/transition_request"] = "state_2"
	_tree["parameters/on_ground/transition_request"] = ["idle", "walk"][abs(x_dir)]

	if is_on_floor():
		if !Input.is_action_just_pressed("jump"):
			_tree["parameters/m/transition_request"] = "ground"
	elif velocity.y > 0:
		_tree["parameters/in_air/transition_request"] = "fall"
	
	
	if debug.main:
		if debug.phy:
			if debug.pos:
				print("pos: ", position)
			if debug.vel:
				print("vel: ", velocity)
			if debug.dir:
				print("x_dir: ", x_dir)
	
	move_and_slide()
