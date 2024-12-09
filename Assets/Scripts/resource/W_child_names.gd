extends Resource
class_name WeaponChildNames

@export var butt: NodePath = "butt"

@export var head_name: StringName = "head"
@export var hurt_colshape_name: StringName = "CollisionShape2D"
@export var hit_colshape_name: StringName = "CollisionPolygon2D"

var head:  = "damageComp/" + head_name
var hurt_colshape: NodePath = "hurtbox/" + hurt_colshape_name
var hit_colshape: NodePath = "hurtbox/" + hit_colshape_name