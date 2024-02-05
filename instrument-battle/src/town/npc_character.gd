extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
signal being_viewed
signal stop_viewed
func _physics_process(delta):

	pass

func being_viewed_function():
	being_viewed.emit()

func stop_viewed_function():
	stop_viewed.emit()
