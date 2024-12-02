extends Sprite2D
class_name DamageGrade

@export var hComp: healthComp
@onready var max_h = hComp.MAX_HEALTH
@export var damageds: Array[Texture2D]
@onready var healty: Texture2D = texture
@onready var dlen = len(damageds) - 1 

func _ready() -> void:
	draw()
	hComp.damage_taken.connect(draw)

func draw():
	var health = hComp.health
	var ratio_damaged = 1 - health / max_h
	print(ratio_damaged)
	if ratio_damaged != 0:
		var index = round(ratio_damaged * dlen)
		texture = damageds[index]
		
	else:
		texture = healty

	

	
