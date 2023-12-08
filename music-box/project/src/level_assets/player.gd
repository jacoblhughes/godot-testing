extends CharacterBody2D
class_name Player

const SPEED = 200.00
var	movement_speed = 0
const JUMP_VELOCITY = 275.00
const DASH_VELOCITY = 400.00
var active = true
var under_water = false
var falling = false
var idle_time = 0
var double_jump_unlocked = false
var jumps = 0
var dash_direction = 1
# Get the gravity from the project settings to be synced with RigidBody nodes.
var default_gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var glider_gravity = 100
var gravity
var dash_unlocked = false
var can_dash = true
var direction=0

@onready var animated_sprite = $AnimatedSprite2D
@onready var dash_timer = $DashTimer
@onready var sprite = $Sprite2D
#test

func _ready():
	movement_speed = SPEED
	gravity = default_gravity
	
func _physics_process(delta):

	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		jumps = 0
		
	direction = 0
	if active == true:
		if Input.is_action_just_pressed('dash') and dash_unlocked:
			if can_dash:
				dash()
			pass
		if under_water and Input.is_action_just_pressed("jump"):
			jump(JUMP_VELOCITY/2)
		if !under_water and Input.is_action_just_pressed("jump") and Input.is_action_pressed("move_down"):
			global_position.y +=1
		elif !under_water and Input.is_action_just_pressed("jump") and is_on_floor():
			jump(JUMP_VELOCITY)
		if !under_water and Input.is_action_just_pressed("jump") and !is_on_floor() and double_jump_unlocked == true and jumps <1:
			jump(JUMP_VELOCITY)
			jumps +=1
			
			
		direction = Input.get_axis("move_left", "move_right")

	if direction < 0:
		dash_direction = -1
	elif direction >0:
		dash_direction = 1 
		
	if direction:
		idle_time = 0
		animated_sprite.flip_h = (direction < 0)
		velocity.x = direction * movement_speed
	else:
		idle_time += delta
		velocity.x = move_toward(velocity.x, 0, movement_speed)
	_update_animations(direction)
	move_and_slide()




func jump(pulse_velocity):
	AudioManager.play_sfx("jump")
	velocity.y = -pulse_velocity
	

func dash():
	gravity = glider_gravity
	sprite.visible = true
	dash_timer.start()
	can_dash = false
	movement_speed = DASH_VELOCITY

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

func unlock_power(level_for_power):
	for level in range(1, level_for_power + 1):
		if level == 1:
			double_jump_unlocked = true
		elif level == 2:
			dash_unlocked = true
	pass


func _on_dash_timer_timeout():
	sprite.visible = false
	gravity = default_gravity
	movement_speed = SPEED
	can_dash = true
	pass # Replace with function body.
