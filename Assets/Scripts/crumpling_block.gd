extends Node2D
@onready var player_detection: Area2D = $player_detection
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	player_detection.body_entered.connect(func(_body:Node2D): fall())

func fall() -> void:
	animation_player.play("fall")
	animation_player.animation_finished.connect(func(_anim_name: StringName ): queue_free())
