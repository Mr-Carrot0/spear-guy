extends CharacterBody2D
class_name Actor

@onready var sprite = $Sprite2D

# @onready var weapon = $weapon

																																																											   
@export var speed := 140.0
@export var jmp_vel := -320.0

@export var weapon: Weapon
@export var armour = 0
	

func flip():
	scale.x = -1
		
func knockback():
	if velocity.y == 0: 
		velocity.y += 200
	velocity *= -1
		
func _physics_process(delta: float) -> void:
		# gravity
	if not is_on_floor():
		velocity.y += get_gravity().y * delta
