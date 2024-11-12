extends CharacterBody2D
class_name Actor

@onready var sprite = $Sprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
																																																												   
@export var speed := 140.0
@export var jmp_vel := -160.0

@export var weapon: Weapon
@export var armour = 0
		
func _physics_process(delta: float) -> void:
		# gravity
	if not is_on_floor():
		velocity.y += gravity * delta
