extends Actor

@onready var _tree: AnimationTree = $AnimationTree
@onready var _ani_player: AnimationPlayer = $AnimationPlayer

var is_flipped = false

var debug = {
	"main": 1,
	"phy": 0
	, "pos": 0
	, "vel": 1
	, "dir": 1,
	"ani": 1
	, "oneshot": 0
}

func _ready():
	_tree.active = true
	

func _physics_process(_delta) -> void:
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jmp_vel

		_tree["parameters/m/transition_request"] = "air"
		# _tree["parameters/[OneShot]/request"] = AnimationNodeOneShot.ONE_SHOT_REQUEST_[Request]
		_tree["parameters/spin/request"] = AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE

	var x_dir = Input.get_axis("move_left", "move_right")
	velocity.x = x_dir * speed if x_dir else move_toward(velocity.x, 0, speed)

	if x_dir != 0:
		is_flipped = bool(1 - x_dir)
	var direction = velocity.normalized()
	
	sprite.flip_h = is_flipped
	sprite.offset.x = [0, -3][int(is_flipped)]
	
	## TREE
	# animation_tree["parameters/[Transition]/transition_request"] = "[state]"
	_tree["parameters/on_ground/transition_request"] = ["idle", "walk"][abs(x_dir)]

	# if is_on_floor() and !Input.is_action_just_pressed("jump"):
	# 	_tree["parameters/m/transition_request"] = "ground"
	# else:
	# 	_tree["parameters/m/transition_request"] = "air"
	
	_tree["parameters/m/transition_request"] = "ground" if is_on_floor() and !Input.is_action_just_pressed("jump") else "air"
	
	if _tree["parameters/spin/request"] == AnimationNodeOneShot.ONE_SHOT_REQUEST_NONE and direction.y > 0 and $Sprite2D.frame_coords==Vector2(7,3):
		_tree["parameters/spin/request"] = AnimationNodeOneShot.ONE_SHOT_REQUEST_ABORT

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
				print(_tree["parameters/spin/request"] == AnimationNodeOneShot.ONE_SHOT_REQUEST_NONE)
	
	move_and_slide()
