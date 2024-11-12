extends CharacterBody2D
class_name Actor

@onready var sprite = $Sprite2D
@onready var weapon = $weapon

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var is_flipped = false

@export var speed := 140.0
@export var jmp_vel := -320.0

@export var MAX_HEALTH := 100.0
@export var health := 100.0
@export var armour = 0

func _ready():
	pass
	
func flip():
	scale.x = -1

func die():
	# replace with death stuff
	print("dies of death")

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# replace with some signal or smth
	if health <= 0:
		die()
