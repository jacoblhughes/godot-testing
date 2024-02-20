extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var player_animation : AnimatedSprite2D = $AnimatedSprite2D


#@export var show_instrument = true
var paused = false
func _ready():

#	%Trumpet.visible = show_instrument
	NavigationManager.on_trigger_spawn.connect(_on_spawn)
	pass

func _physics_process(delta):

	if !paused:
		
		var direction_y = Input.get_axis("move_up", "move_down")

		if direction_y:
			if direction_y > 0:
				player_animation.play("down")
				%Detection.rotation_degrees = 90
			elif direction_y < 0:
				player_animation.play("up")
				%Detection.rotation_degrees = -90
			velocity.y = direction_y * SPEED

		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)

			
		var direction = Input.get_axis("move_left", "move_right")

		if direction:

			if direction > 0:
				player_animation.play("right")
				%Detection.rotation_degrees = 0
			elif direction < 0:
				player_animation.play("left")
				%Detection.rotation_degrees = 180
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)


		move_and_slide()

func _on_spawn(spawn_position):
	global_position = spawn_position

func on_npc_interact(npc_position):

	global_position = global_position.lerp(npc_position,1.0)
	velocity = Vector2.ZERO
	
	
	
