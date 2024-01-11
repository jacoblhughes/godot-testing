extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var instrument_sound : GPUParticles2D = $Instrument/GPUParticles2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	pass

func _physics_process(delta):
	
	if Input.is_action_pressed("play_instrument"):
		instrument_sound.emitting = true

	else:
		instrument_sound.emitting = false
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		instrument_sound.process_material.initial_velocity_max += SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		instrument_sound.process_material.initial_velocity_max += SPEED
	move_and_slide()
