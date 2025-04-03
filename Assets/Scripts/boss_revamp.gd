extends Actor
# main scene: res://Scenes/start.tscn
"""attack patterns (mockup)

jump + knife:

 kkkk  RRR
   kk  RRR
  kk	^
 k	    |
		|

chains:

cc		  c       cc
  cc	 c     cc
	c P c  cc       R

walls:


"""


@export var player: Player
# @onready var sprite = $sprite
@onready var col: CollisionShape2D = $CollisionShape2D

# Dictionary[StringName, Resource]
@export var summonDict := {
	&"knife": preload("res://Scenes/summons/throwing_knife.tscn"),
	&"ice": preload("res://Scenes/icicle.tscn"),
	&"wall": preload("res://Scenes/wall.tscn"),
	# &"chain": preload(chain),
}

# @onready var summon_keys: Array = summonDict.keys()

enum {
	MOVE,
	JUMP,
	ATTACK,
	DEFEATED,
}

@onready var knife_holder: Node2D = $summons/knife

var current_state := MOVE
var desired_vel: float

var p_dir: int
var old_p_dir: int

@export var desired_distance: float = 100

func _ready():
	# if not player:
	#     player = $"../Player"
	if player:
		p_dir = Globals.bool_to_i8(position.x - player.position.x < 0)
		old_p_dir = p_dir


func _physics_process(delta):

	# Testing
	
	# Testing

	# movement
	if player:
		var x_diff := position.x - player.position.x
		p_dir = Globals.bool_to_i8(x_diff < 0)
		var x_dir := p_dir * Globals.bool_to_i8(abs(x_diff) > desired_distance)

		if old_p_dir != p_dir:
			scale.x = -1
			old_p_dir = p_dir

		match current_state:
			MOVE:
				# if (abs(abs(position.x - player.position.x) - desired_distance) > 1):
				# 	velocity.x = move_toward(velocity.x, speed * x_dir, speed)
				# else:
				# 	velocity.x = move_toward(velocity.x, 0, speed)
				var acepted_distance = abs(abs(position.x - player.position.x) - desired_distance)
				velocity.x = move_toward(velocity.x, (speed * x_dir if (acepted_distance > 1) else 0.0), speed)
			JUMP:
				# jump
				summon_projs(&"knife", $summons/knife)
			DEFEATED:
				pass
	super(delta)


func knockback(): pass

func summon_projs(key: StringName, holder: Node2D):
	var markers = holder.children

	for i in range(len(markers)):
		summon_proj(key, markers[i])
		# var proj = summonDict[key].instantiate()
		# proj.global_position = markers[i].global_position

		# get_tree().root.add_child(proj)

func summon_proj(key: StringName, marker: Marker2D):
	var tmp = summonDict.get(key)
	if tmp != null:
		var proj = tmp.instantiate()
		proj.global_rotation = marker.global_rotation
		proj.global_position = marker.global_position

		get_tree().root.add_child(proj)
	else: print_debug("could not summon proj")

	# if _bypass or key in summonDict.keys():
	# 	var proj = summonDict.get(key).instantiate()
	# 	proj.global_position = marker.global_position

	# 	get_tree().root.add_child(proj)