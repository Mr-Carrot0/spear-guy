extends CharacterBody2D
class_name Actor

@onready var sprite = $Sprite2D
<<<<<<< HEAD
@onready var weapon = $weapon

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var is_flipped = false

=======
																																																												   
>>>>>>> damage
@export var speed := 140.0
@export var jmp_vel := -320.0

<<<<<<< HEAD
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
	
func damage(amount: int):
	health -= amount
	damage_taken.emit()
	
	if (health < 0):
		death.emit()
=======
@export var weapon: Weapon
@export var armour = 0
>>>>>>> damage
		
func knockback():
	if velocity.y == 0: 
		velocity.y += 200
	velocity *= -1
		
<<<<<<< HEAD
=======
func _physics_process(delta: float) -> void:
		# gravity
	if not is_on_floor():
		velocity.y += get_gravity().y * delta
>>>>>>> damage
