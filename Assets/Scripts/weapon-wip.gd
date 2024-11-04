extends Node2D
class_name Weapon_wip

@onready var butt: Sprite2D = $butt
@onready var head: Sprite2D = $head

@export_category("health")
@export var max_health: float = 100
@export var health: float = 100
@export var damage: float = 10
@export var is_indestrucable: bool = false


func _ready():
	pass