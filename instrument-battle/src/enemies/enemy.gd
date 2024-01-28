extends CharacterBody2D
class_name Enemy
@export var health = 3
@export var fade_scene : PackedScene
func take_damage(amount):

	health -= amount
	if health == 0:
		queue_free()
#		const SMOKE_SCRENE = preload("res://src/enemies/ghost_smoke.tscn")
		var fade = fade_scene.instantiate()
		get_parent().add_child(fade)
		fade.global_position = global_position
