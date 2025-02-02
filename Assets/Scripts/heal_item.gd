extends Node2D
# this is me applying negative damage to heal, the health system is bad

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var heal: damageComp = $damageComp

func  _ready() -> void:
	heal.inflicted.connect(_on_healed)

func _on_healed() -> void:
	audio_stream_player.play()
	audio_stream_player.finished.connect(queue_free)
