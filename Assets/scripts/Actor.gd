extends CharacterBody2D
class_name Actor

@onready var sprite = $Sprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

signal health_update()

# @export 
@export var speed := 100.0
@export var jmp_vel := -160.0

@export var MAX_HEALTH: float = 100
@export var health: float = 100
@export var bar: Bar2
@export var weapon: Weapon
@export var armour = 0

func init_act():
	health_update.emit(health)

func _die():
	# replace with death stuff
	health_update.emit(health)
	print("dies of death")

func _process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# replace with some signal or smth
	if position.y > ProjectSettings.get_setting("display/window/size/viewport_height") or health < 0:
		_die()
