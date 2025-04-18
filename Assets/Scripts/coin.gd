extends Area2D

@export var score = 300
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		Globals.player_score += score
		animation_player.play("pickup")
		animation_player.animation_finished.connect(queue_free)
