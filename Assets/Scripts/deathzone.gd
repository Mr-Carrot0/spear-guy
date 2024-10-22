@tool # allow the script to run in the editor

extends Area2D

@export var collision_shape: Shape2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	update_collision_shape()

func _process(_delta: float) -> void:
	if Engine.is_editor_hint():
		update_collision_shape()

func update_collision_shape():
	collision_shape_2d.shape = collision_shape


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		print("die")
		get_tree().call_deferred("reload_current_scene")
