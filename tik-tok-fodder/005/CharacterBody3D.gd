extends CharacterBody3D


const SPEED = 200
const JUMP_VELOCITY = 4.5
var look_speed = 0.05
var max_look_angle = 45
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
#	if not is_on_floor():
#		velocity.y -= gravity * delta
	# Handle Jump.
#	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
#		velocity.y = JUMP_VELOCITY
#	if Input.is_action_pressed("look_left"):
#		rotation_degrees.y += 5
#	if Input.is_action_pressed("look_right"):
#		rotation_degrees.y -= 5
#	if Input.is_action_pressed("look_up"):
#		rotation_degrees.x += 5
#	if Input.is_action_pressed("look_down"):
#		rotation_degrees.x -= 5
	if Input.is_action_pressed("look_up"):
		rotate_x(-look_speed)
	elif Input.is_action_pressed("look_down"):
		rotate_x(look_speed)

#	# Clamp the rotation to prevent flipping over.
#	var current_pitch = atan2(transform.basis[1][2], transform.basis[2][2])
#	current_pitch = rad_to_deg(current_pitch)
#	current_pitch = clamp(current_pitch, -max_look_angle, max_look_angle)
#
#	# Create a quaternion representing the clamped rotation around the X-axis.
#	var clamped_rotation = Quaternion(Vector3(1, 0, 0), deg_to_rad(current_pitch))
#	# Apply the clamped rotation to the transform, preserving the Y-axis rotation.
#	transform.basis = Basis(clamped_rotation) * transform.basis.rotated(Vector3(0, 1, 0), rotation.y)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	print(transform.basis)
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

