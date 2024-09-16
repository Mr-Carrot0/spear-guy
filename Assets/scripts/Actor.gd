extends CharacterBody2D # inherites all propperties from "CharacterBody2D"
class_name Actor # sets the class name property so we can more easily refrence it when we need to
# e.g. see line 1 of Player.gd
@onready var sprite = $Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


# @export 
@export var speed := 100.0
@export var jmp_vel := -160.0

@export var MAX_HEALTH: float = 100
@export var life := MAX_HEALTH
# @export var weapon = ""
# @export var weaponHealth := 100

func _die():
	print("dies of death")

func _process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if position.y > ProjectSettings.get_setting("display/window/size/viewport_height") or life <= 0:
		_die()
	# 