extends Area2D

@export var weaponName = ""
@export var weaponHealth := 100

# Called when the node enters the scene tree for the first time.
func _ready():
	monitoring = true
	monitorable = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func area_entered(area: Area2D):
	print("collition between ", weaponName, " and ", area.weaponName)