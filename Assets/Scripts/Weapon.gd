extends Node2D
class_name Weapon

enum condition {
	PRISTINE,
	DAMAGED,
	DESTROYED,
	# DIRTY
}
# @export var names:Weapon_names
@onready var butt: Sprite2D = $butt # get_node(names.butt)
@onready var head: Sprite2D = $head # get_node(names.head)
@onready var hitbox: Area2D = $head/hitbox # get_node(names.hitbox)
@onready var hurtbox: Area2D = $hurtbox # get_node(names.hurtbox)

@export_category("health")
@export var max_health: float = 100
@export var health: float = max_health
@export var damage: float = 10

@export_category("status")
@export var is_indestrucable: bool = false
@export var status := condition.PRISTINE


func _ready():
	set_defults([butt, head])

func _process(_delta):
	_update_status()

func set_defults(arr: Array[Sprite2D]):
	for key in arr:
		if key.texture == null:
			key.texture = load("res://Assets/Sprites/spear-destruction-" + key.name + ".png")


func _update_status():
	if status == condition.PRISTINE and health < max_health and not is_indestrucable:
		status = condition.DAMAGED
	if status == condition.DAMAGED and health <= 0:
		status = condition.DESTROYED
		# play some fancy animation maybe
		# then queue_free()
	# signal weapon_status_changed(status)
		
func hit(target):
	if target is Weapon and not target.is_indestrucable:
		target.health -= damage
		if target.health < 0:
			target.status = condition.DESTROYED
	
	if target is Actor:
		target.health -= max(damage - target.armour, 1)