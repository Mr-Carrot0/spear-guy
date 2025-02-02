extends Area2D

# TODO use the same function here and in health component or make this simply take the players full hp
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		Globals.change_player_extra_life(-1)
		get_tree().call_deferred("reload_current_scene")
