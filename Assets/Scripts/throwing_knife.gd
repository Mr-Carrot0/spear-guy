extends RigidBody2D

func _ready():
    linear_velocity = Vector2(0, -1).rotated(rotation)

