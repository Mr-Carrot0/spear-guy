extends AudioStreamPlayer
class_name damageSoundComp

@export var health: healthComp
@export var keep_playing_on_parent_free: bool = false

func _ready() -> void:
	if keep_playing_on_parent_free:
		health.damage_taken.connect(play_global)	
	else:
		health.damage_taken.connect(play)
			
func play_global():
	Globals.play_sound(stream.resource_path)
