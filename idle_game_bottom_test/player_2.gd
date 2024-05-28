extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -400.0
var direction = Vector2.LEFT
# Get the gravity from the prsoject settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	# Handle jump.

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	if direction:
		velocity = direction * SPEED


	move_and_slide()
