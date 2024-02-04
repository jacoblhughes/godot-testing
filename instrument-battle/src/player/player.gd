extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var player_animation : AnimatedSprite2D = $AnimatedSprite2D
@export var body_collision_disabled = false
@export var feet_collision_disabled = false
@export var show_instrument = true
func _ready():
	%BodyCollision.disabled = body_collision_disabled
	%FeetCollision.disabled = feet_collision_disabled
	%Trumpet.visible = show_instrument
	NavigationManager.on_trigger_spawn.connect(_on_spawn)
	pass

func _physics_process(delta):

		
	var direction_y = Input.get_axis("move_up", "move_down")

	if direction_y:
		if direction_y > 0:
			player_animation.play("default")
#			attack.rotation_degrees = 90
		elif direction_y < 0:
			player_animation.play("back")
#			attack.rotation_degrees = -90
		velocity.y = direction_y * SPEED

	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

		
	var direction = Input.get_axis("move_left", "move_right")

	if direction:
		player_animation.play("side")
		if direction > 0:
			player_animation.flip_h = false
#			attack.rotation_degrees = 0
		elif direction < 0:
			player_animation.flip_h = true
#			attack.rotation_degrees = 180
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


	move_and_slide()

func _on_spawn(spawn_position):
	global_position = spawn_position
