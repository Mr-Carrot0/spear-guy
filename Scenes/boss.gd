extends CharacterBody2D

enum State {
	SUMMON,
	DASH,
	SUMMON_UNDERLINGS,
	JUMP,
	DEFEATED
}
var current_state: State = State.SUMMON_UNDERLINGS
var phase_timer = 0.0

@export var summonable_scene_1: PackedScene
@export var summonable_scene_2: PackedScene
@export var underling_scene: PackedScene

@export var summon_area: Shape2D 
@export var dash_speed: float = 400.0
@export var phase_duration: float = 5.0  

func get_spawn_points() -> Array:
	return $SpawnArea.get_children()

#var player: Node2D

func _ready():
	#player = get_tree().get_root().find_node("Player", true, false)
	pass

func _physics_process(delta: float) -> void:
	match current_state:
		State.SUMMON:
			handle_summon_phase()
		State.DASH:
			pass
		State.SUMMON_UNDERLINGS:
			handle_underling_phase()
		State.DEFEATED:
			pass
		State.JUMP:
			handle_jump_phase()
	phase_timer -= delta
	if phase_timer <= 0.0:
		switch_phase()

func handle_jump_phase()-> void:
	pass

func handle_summon_phase():

	if randf() < 0.1:  
		summon_random_object()


func summon_random_object():
	var spawn_points = get_spawn_points()
	if spawn_points.size() > 0:
		var random_point = spawn_points[randi() % spawn_points.size()]
		var summon_scene = summonable_scene_1 if randf() < 0.3 else summonable_scene_2
		var summon_instance = summon_scene.instantiate()
		summon_instance.position = random_point.global_position
		get_parent().add_child(summon_instance)

func handle_dash_phase():
	pass
	#if player:
	#	var direction = (player.position - position).normalized()
	#	velocity = direction * dash_speed
	#	move_and_slide()

func handle_underling_phase():
	if randf() < 0.05: 
		summon_underling()
		
func summon_underling():
	var instance = underling_scene.instantiate()
	instance.position = position + Vector2(randf_range(0, 50), randf_range(-50, 50))
	get_parent().add_child(instance)

func handle_defeat_phase():
	pass

func switch_phase():
	phase_timer = phase_duration
	var state = randi() % State.DEFEATED # Randomly pick a phase except DEFEATED it needs to be the last state
	# in godot enums are named integers 
	current_state = state
	#if health <= 0:
	#	current_state = State.DEFEATED
	
