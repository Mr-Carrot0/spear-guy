extends Actor

const SPEED = 5000.0
const JUMP_VELOCITY = -130.0

var debug = {
	"main": true
	, "pos": false
}

func _physics_process(delta):

	## We'll change the button mapping later but we don't currently have
	## any ui to interfere with ;)
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED * delta
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * delta)
	
	if debug.main:
		if debug.pos:
			print(velocity)
			print(position)
	
	move_and_slide()