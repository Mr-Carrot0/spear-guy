extends Resource
class_name WeaponChildNames

@export_group("Direct Childs")
@export var head: NodePath = "head"
@export var body: NodePath = "body"
@export var butt: NodePath = "butt"
@export var hurtbox: NodePath = "hurtbox"

@export_group("Don't worry about these appearing empty. They're not.")
@export var hitbox := NodePath(str(head) + "/hitbox")
@export var hurt_colshape := NodePath(str(hurtbox) + "/CollisionShape2D")
@export var hit_colshape := NodePath(str(hitbox) + "/CollisionPolygon2D")