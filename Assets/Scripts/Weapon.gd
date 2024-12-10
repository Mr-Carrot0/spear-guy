# Feels like some parts of this should be moved to Spear.gd
extends Node2D
class_name Weapon

enum condition {
	PRISTINE,
	DAMAGED,
	DESTROYED,
	# DIRTY
}

@onready var body: Node2D = $body
@onready var hurtbox: Area2D = $hurtbox
@onready var hitbox: Area2D = $damageComp

@export var w_names := WeaponChildNames.new()

@onready var head: Sprite2D = get_node(w_names.head) # $head
@onready var butt: Sprite2D = get_node(w_names.butt) # $butt

@onready var hurt_colshape = get_node(w_names.hurt_colshape) # $hurtbox/CollisionShape2D
@onready var hit_colshape = get_node(w_names.hit_colshape) # $damageComp/CollisionPolygon2D

@export_category("body")
@export var body_count := 1
@export var body_img: Texture2D = preload("res://Assets/Sprites/spear-destruction-body.png")

@export_category("health")
@export var max_health: float = 100
@onready var health: float = max_health
@export var damage: float = 4

@export_category("status")
@export var is_indestrucable: bool = false
@export var status := condition.PRISTINE


@export_category("vec")
@export var spacing_body := Vector2i(6, -6)
var off: Vector2i

func _ready(): ## when var w = Weapon.new(): w.body_count = new_body_count; w.request_ready()
	## test
	set_defults([butt, head])
	for i in range(body_count):
		var tmp = Sprite2D.new()
		tmp.texture = body_img
		tmp.position = i * spacing_body # add Vector2 constructor if error

		body.add_child(tmp)
		print(tmp.position)
	hitbox.position = spacing_body * (body_count - 1) # add Vector2 constructor if error
	print(hitbox.position)
	hurt_colshape.shape.b += Vector2(spacing_body * (body_count - 1))

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
		queue_free()
	# signal weapon_status_changed(status)
		
func hit(target):
	if target is Weapon and not target.is_indestrucable:
		target.health -= damage
		if target.health < 0:
			target.status = condition.DESTROYED
	
	if target is Actor:
		target.health -= max(damage - target.armour, 1)
