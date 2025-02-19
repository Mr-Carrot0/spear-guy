extends Area2D
@onready var heart: Sprite2D = $Heart
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


func _ready() -> void:
	body_entered.connect(give_player_life)

func give_player_life(_body: Node2D) -> void:
	
	Globals.player_extra_live += 1

	animation_player.animation_finished.connect(func(_name: String): queue_free())
	audio_stream_player_2d.play()
	animation_player.play("collect")
