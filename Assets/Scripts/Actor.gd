extends CharacterBody2D
class_name Actor

signal damage_taken
signal death

@onready var sprite = $Sprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


@export var speed := 140.0
@export var jmp_vel := -160.0

@export var MAX_HEALTH := 100.0
@export var health := MAX_HEALTH
@export var weapon: Weapon
@export var armour = 0

func damage(amount: int):
	health -= amount
	damage_taken.emit()
	
	if (health < 0):
		death.emit()
		
		queue_free()
		
func _physics_process(delta: float) -> void:
		# gravity
	if not is_on_floor():
		velocity.y += gravity * delta
