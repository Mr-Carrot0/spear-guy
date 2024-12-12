extends AudioStreamPlayer
class_name damageSoundComp

@export var health: healthComp

func _ready() -> void:
	health.damage_taken.connect(play)
