extends CharacterBody2D
class_name Actor

signal damage_taken
signal death

@onready var sprite = $Sprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_flipped = false

@export var weapon_node_path: NodePath = "weapon"

@onready var weapon: Weapon = get_node(weapon_node_path)

@export_category("physics")
@export var speed := 140.0
@export var jmp_vel := -320.0

@export_category("health")
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
		
		queue_free()
