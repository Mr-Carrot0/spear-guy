extends Node2D
class_name Weapon

enum condition {
	PRISTINE,
	DAMAGED,
	DESTROYED
}

@onready var butt: Sprite2D = $butt
@onready var head: Sprite2D = $head
@onready var hitbox: Area2D = $hitbox
@onready var hurtbox: Area2D = $hurtbox

@export_category("health")
@export var max_health: float = 100
@export var health: float = 100
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