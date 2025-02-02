extends Node2D

@onready var icicle: Icicle = $icicle
@onready var player_detection: Area2D = $player_detection

func _ready() -> void:
	player_detection.body_entered.connect(func (_body: Node2D): drop_spike())

func drop_spike() -> void:
	icicle.process_mode = Node.PROCESS_MODE_INHERIT
	player_detection.queue_free()
