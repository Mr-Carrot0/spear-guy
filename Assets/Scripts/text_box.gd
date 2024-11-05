extends CanvasLayer

@export var content = "Lorem ipsum dolar amet sinus dolores aptum dragon
I am eating food in my kitchen, what are you doing?
Can I join you for a supper?"

@export var typeingspeed:float = 20
var basedelay:float = 1 / typeingspeed

func _ready() -> void:
	for char in content:
		var delay = basedelay
		
		if char == '\n':
			delay *= 5
			
		await get_tree().create_timer(delay).timeout
		$ColorRect/Label.text += char

		
