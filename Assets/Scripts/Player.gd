extends Actor
class_name Player

@onready var _tree: AnimationTree = $AnimationTree
@onready var weapon: Spear = $weapon

var jump_time = 0.0
const max_jump_time = 0.3 # maximum time holding the jump button has effect
const jump_accel = 500.0

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
	
	# rotate spear
	var spear_rotation = PI/6 * delta
	if Input.is_action_pressed("look_up"):
		weapon.rotate(spear_rotation)
		
	if Input.is_action_pressed("look_lown"):
		weapon.rotate(-spear_rotation)
		
	# handle jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jmp_vel
		jump_time = 0.0
		
		# cosmetics
		$jumpSound.play()
		_tree["parameters/m/transition_request"] = "air"
		# _tree["parameters/[OneShot]/request"] = AnimationNodeOneShot.ONE_SHOT_REQUEST_\request\
		_tree["parameters/spin/request"] = AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
		
	if Input.is_action_pressed("jump") and jump_time < max_jump_time:
		jump_time += delta
		velocity.y -= jump_accel * delta
		
	# if pressing the jump aftter relasing in the air	
	if not Input.is_action_pressed("jump") and not is_on_floor():
		jump_time = max_jump_time
	
	
	var x_dir = Input.get_axis("move_left", "move_right")
	if x_dir:
		velocity.x = x_dir * speed 
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	# var direction = velocity.normalized()

	
	## TREE
	# animation_tree["parameters/[Transition]/transition_request"] = "[state]"
	_tree["parameters/on_ground/transition_request"] = ["idle", "walk"][abs(x_dir)]
		
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
	
	
