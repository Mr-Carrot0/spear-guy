extends Node2D
@export var strength: int = 400
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _on_jumpad_body_entered(body: Node2D) -> void:
	if body is Player:
		body.velocity = -(Vector2(0,strength))
		audio_stream_player_2d.play()
		
