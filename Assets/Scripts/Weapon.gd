extends Resource
class_name Weapon

@export var max_health: float = 100
@export var health: float = 100
@export var damage: float = 10
# @export var sprite: Texture2D
@export var is_indestrucable: bool = false

var status = "pristine" if not is_indestrucable else "indestrucable"

func _update():
	if status == "pristine" and health < max_health:
		status = "damaged"
		
func _process(_delta):
	_update()
	
func hit(target):
	if target is Weapon and target.is_indestrucable == false:
		target.health -= damage
		if target.health < 0:
			target.status = "destroyed"
	
	if target is Actor:
		target.health -= max(damage - target.armour, 1)
