extends Area2D
#@export var to_scene: 
@export var scene: String 
@onready var to_scene: String = "res://Scenes/" + scene + ".tscn"

func _on_body_entered(body: Node2D) -> void:
	
	if body is Player:

		#get_tree().call_deferred("change_scene_to_packed", to_scene)  
		get_tree().call_deferred("change_scene_to_file",to_scene)
