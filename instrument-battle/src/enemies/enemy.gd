extends CharacterBody2D
class_name Enemy
@export var health = 3
func take_damage(amount):

	health -= amount
	if health == 0:
		queue_free()
		const SMOKE_SCRENE = preload("res://src/enemies/ghost_smoke.tscn")
		var smoke = SMOKE_SCRENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
