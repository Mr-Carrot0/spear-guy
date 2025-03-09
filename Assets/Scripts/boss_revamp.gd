extends Actor
# main scene: res://Scenes/start.tscn

@export var player: Player
# @onready var sprite = $sprite
@onready var col: CollisionShape2D = $CollisionShape2D

# Dictionary[String, Resource]
@export var summonDict := {
	"ice": preload("res://Scenes/icicle.tscn"),
	"wall": preload("res://Scenes/wall.tscn"),
	# "chain": preload(chain),
	# "knife": preload(knife),
}

@onready var summons: Array = summonDict.keys()

enum {
	MOVE,
	JUMP,
	SUMMON,
	DEFEATED,
}

var current_state := MOVE
var desired_vel: float

@export var desired_distance: float = 10

var bool_to_int = Globals.bool_to_i8

func _ready():
	# if not player:
	#     player = $"../Player"
	pass

func _physics_process(delta):

	super(delta)

	# movement
	if player:
		var x_diff = position.x - player.position.x
		var x_dir = bool_to_int.call(x_diff < 0) * bool_to_int.call(abs(x_diff) > desired_distance)

		match current_state:
			MOVE:
				if (abs(abs(position.x - player.position.x) - desired_distance) > 1):
					velocity.x = speed * x_dir
				else:
					velocity.x = move_toward(velocity.x, 0, speed)
			DEFEATED:
				pass
	move_and_slide()