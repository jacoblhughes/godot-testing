extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var attack_animation : AnimationPlayer = $AnimationPlayer
@onready var blast_area : Area2D = $Instrument/Attack/Blast
#@onready var attack : Node2D = $Instrument/Attack
@onready var player_animation : AnimatedSprite2D = $AnimatedSprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var can_blast = true
func _ready():
	attack_animation.animation_finished.connect(_on_attack_finished)

	pass

func _physics_process(delta):
	if Input.is_action_pressed("play_instrument") and can_blast:
		attack_animation.play("blast")
		can_blast = false

		pass
		
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

func _on_attack_finished(anim_name: String):
	if anim_name == "blast":
		attack_animation.play("RESET")
		can_blast = true
	pass
