extends CharacterBody2D # inherites all propperties from "CharacterBody2D"
class_name Actor # sets the class name property so we can more easily refrence it when we need to
# e.g. see line 1 of Player.gd
@onready var sprite = $Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# @export 
var MAX_HEALTH: float = 100
var life := MAX_HEALTH
var weapon = ""
var weaponHealth := 100


func _process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
