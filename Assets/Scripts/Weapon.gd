# Feels like some parts of this should be moved to Spear.gd
extends Node2D
class_name Weapon

enum condition {
	PRISTINE,
	DAMAGED,
	DESTROYED
}

@export_category("names")
# @export var names:Weapon_names

@onready var butt: Sprite2D = $butt # get_node(NodePath(names.butt_name))
@onready var head: Sprite2D = $head # get_node(NodePath(names.head_name))
#@onready var hitbox: Area2D = $head/hitbox # get_node(NodePath(names.hitbox_name))
@onready var hurtbox: Area2D = $hurtbox # get_node(NodePath(names.hurtbox_name))


@export_category("health")
@export var max_health: float = 100
@export var health: float = max_health
@export var damage: float = 10

@export_category("status")
@export var is_indestrucable: bool = false
@export var status := condition.PRISTINE


func _ready():
	# defults
	var n = 0
	for i in [butt.texture, head.texture]:
		if i == null:
			i = [
				preload("res://Assets/Sprites/spear-destruction-butt.png"),
				preload("res://Assets/Sprites/spear-destruction-body.png")
				][n]
		n += 1

func _process(_delta):
	_update()


func _update():
	if status == condition.PRISTINE and health < max_health:
		status = condition.DAMAGED
		
func hit(target):
	if target is Weapon and not target.is_indestrucable:
		target.health -= damage
		if target.health < 0:
			target.status = condition.DESTROYED
	
	if target is Actor:
		target.health -= max(damage - target.armour, 1)
