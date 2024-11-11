extends CanvasLayer


@export_multiline var contents:Array[String]

@export var typeingspeed:float = 20
var base_delay:float = 1 / typeingspeed

var current_content: String
var current_content_index: int
var time_elapsed: float = 0

func _ready() -> void:
	next_content()

func _process(delta: float) -> void:
	if current_content_index < current_content.length():
		time_elapsed += delta
		var current_char = current_content[current_content_index] 
		var delay = base_delay
		
		if current_char == '\n':
			delay *= 5
		
		if time_elapsed > delay:
			$ColorRect/Label.text += current_char
			time_elapsed = 0
			current_content_index += 1
			

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("continue"):
		next_content()

func next_content() -> void: 
	if not contents.is_empty():
		
		current_content = contents.pop_front()
		current_content_index = 0
		$ColorRect/Label.text = ""
		
	else:
		queue_free()
