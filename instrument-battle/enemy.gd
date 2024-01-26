extends CharacterBody2D
class_name GhostEnemy

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var health = 3
const HIT_DAMAGE = 1
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	pass

func take_damage():

	#health -= HIT_DAMAGE
	if health == 0:
		queue_free()
		const SMOKE_SCRENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCRENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
		

	
