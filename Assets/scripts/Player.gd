extends Actor

@onready var _tree := $AnimationTree

const SPEED := 5000.0
const JUMP_VELOCITY := -150.0

var debug = {
	"main": 1
	, "pos": 0
}
func _ready():
	_tree.active = true
	

func _physics_process(delta) -> void:

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var dir = Input.get_axis("move_left", "move_right")
	velocity.x = dir * SPEED * delta if dir else move_toward(velocity.x, 0, SPEED * delta)
	
	dir = velocity.normalized()
	
	

	if debug.main:
		if debug.pos:
			print(velocity)
			print(position)
	
	move_and_slide()
