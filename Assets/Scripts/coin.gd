extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		Globals.change_player_score(300)
		animation_player.play("pickup")
		animation_player.animation_finished.connect(queue_free)
