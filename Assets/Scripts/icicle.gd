extends AnimatableBody2D
class_name Icicle
@export var velocity_y:float = 0
@onready var damage_comp: damageComp = $damageComp

func _ready() -> void:
	damage_comp.hit.connect(_on_hit)
	
func _physics_process(delta: float) -> void:
	velocity_y += get_gravity().y * delta
	position.y += velocity_y * delta
	damage_comp.damage_amount = int(velocity_y) 

func _on_hit():
	queue_free()
