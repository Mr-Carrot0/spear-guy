extends Resource
class_name Weapon

enum condition {
	PRISTINE,
	DESTROYED,
	DAMAGED
}

@export var max_health: float = 100
@export var health: float = max_health
@export var damage: float = 10
# @export var sprite: Texture2D
@export var is_indestrucable: bool = false

var status = condition.PRISTINE

func _update():
	if status == condition.PRISTINE and health < max_health:
		status = condition.DAMAGED
		
func _process(_delta):
	_update()
	
func hit(target):
	if target is Weapon and not target.is_indestrucable:
		target.health -= damage
		if target.health < 0:
			target.status = condition.DESTROYED
	
	if target is Actor:
		target.health -= max(damage - target.armour, 1)
