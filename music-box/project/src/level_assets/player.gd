extends CharacterBody2D
class_name Player

const SPEED = 200.00
const JUMP_VELOCITY = 250.00
var active = true
var under_water = false
var falling = false
var idle_time = 0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	var direction = 0
	if active == true:
		if under_water and Input.is_action_just_pressed("jump"):
			jump(JUMP_VELOCITY/2)
		if !under_water and Input.is_action_just_pressed("jump") and is_on_floor():
			jump(JUMP_VELOCITY)

		direction = Input.get_axis("move_left", "move_right")
	if direction !=0:
		idle_time = 0
		animated_sprite.flip_h = (direction < 0)
	else:
		idle_time += delta
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	_update_animations(direction)
	move_and_slide()

func jump(pulse_velocity):
	velocity.y = -pulse_velocity

func _update_animations(direction):
	if is_on_floor():
		if direction == 0:
			if idle_time < 20:
				animated_sprite.play("idle")
			elif idle_time > 20 and idle_time < 40:
				animated_sprite.play("idle_2")
			else:
				animated_sprite.play("idle_3")
		else:
			animated_sprite.play('run')
	else:
		if velocity.y < 0:
			animated_sprite.play("jump")
		else:
			animated_sprite.play('fall')
			
