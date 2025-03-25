extends Node2D

@export var delay: int = 5
@export var projectile: PackedScene  # needs to be bullet

@export var random_delay_strength: int = 1

@onready var spawn_point: Marker2D = $spawn_point
@onready var shoot_timer: Timer = $shoot_timer
@onready var bang: AudioStreamPlayer2D = $bang
@onready var smoke: CPUParticles2D = $smoke
@onready var visible_on_screen_enabler_2d: VisibleOnScreenEnabler2D = $VisibleOnScreenEnabler2D

func _ready() -> void:
	shoot_timer.timeout.connect(shoot)
	var random_delay =  (int(position.length()) % 5) * random_delay_strength
	shoot_timer.wait_time = delay + random_delay
	shoot_timer.one_shot = false
	shoot_timer.start()
	
	visible_on_screen_enabler_2d.screen_entered.connect(shoot)
	
func shoot():
	# effects
	bang.play()
	smoke.emitting = true
	
	# spawn projectile
	var proj = projectile.instantiate()
	proj.global_position = spawn_point.global_position
	var direction = Vector2(cos(rotation), sin(rotation))  # if the canon is rotated  (eg in big guy)
	proj.direction = direction
	get_tree().get_root().add_child(proj) 
	
