extends Resource
class_name WeaponChildNames

@export_group("Direct Child (Nodepath)")
@export var head: NodePath = "head"
@export var body: NodePath = "body"
@export var butt: NodePath = "butt"
@export var hurtbox: NodePath = "hurtbox"

@export_group("Others (StringName)")
@export var hitbox_name: StringName = "hitbox"
@export var hurt_colshape_name: StringName = "CollisionShape2D"
@export var hit_colshape_name: StringName = "CollisionPolygon2D"

var hitbox := NodePath(str(head) + "/" + hitbox_name)
var hurt_colshape := NodePath(str(hurtbox) + "/" + hurt_colshape_name)
var hit_colshape := NodePath(str(hitbox) + "/" + hit_colshape_name)