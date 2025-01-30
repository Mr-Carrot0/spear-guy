extends Node2D

@export var delay: int = 5
@export var projectile: PackedScene

@onready var spawn_point: Marker2D = $spawn_point
@onready var shoot_timer: Timer = $shoot_timer
@onready var bang: AudioStreamPlayer2D = $bang
@onready var smoke: CPUParticles2D = $smoke
@onready var visible_on_screen_enabler_2d: VisibleOnScreenEnabler2D = $VisibleOnScreenEnabler2D

func _ready() -> void:
	shoot_timer.timeout.connect(shoot)
	shoot_timer.wait_time = delay
	shoot_timer.one_shot = false
	shoot_timer.start()
	
	visible_on_screen_enabler_2d.screen_entered.connect(shoot)
	
func shoot():
	# effects
	bang.play()
	smoke.emitting = true
	
	# spawn projectile
	var projectile = projectile.instantiate()
	projectile.position = spawn_point.position
	add_child(projectile)
