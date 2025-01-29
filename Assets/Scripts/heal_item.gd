extends Node2D

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
#@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var heal: damageComp = $damageComp

func  _ready() -> void:
	heal.inflicted.connect(_on_healed)

func _on_healed() -> void:
	print("healed")
	audio_stream_player.play()
	audio_stream_player.finished.connect(queue_free)
