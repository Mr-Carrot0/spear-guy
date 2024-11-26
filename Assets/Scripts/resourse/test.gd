extends Resource
class_name Weapon_names

@export var butt: NodePath = "butt"
@export var body: NodePath = "body"
@export var head: NodePath = "head"

@export var hitbox: NodePath = "hitbox"
@export var hurtbox: NodePath = "hurtbox"
@export var colshape := NodePath(str(hurtbox) + "/CollisionShape2D")
