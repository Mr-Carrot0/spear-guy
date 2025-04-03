extends damageComp
class_name Bullet

@export var speed = -200

func _ready() -> void:
	super()
	body_entered.connect(_on_hit)

func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta

func _on_hit(_body: Node2D):
	queue_free()
