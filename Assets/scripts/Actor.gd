extends CharacterBody2D # inherites all propperties from "CharacterBody2D"
class_name Actor # sets the class name property so we can more easily refrence it when we need to 
# e.g. see line 1 of Player.gd

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not is_on_floor():
		velocity += gravity * delta
