extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var attack_animation : AnimationPlayer = $AnimationPlayer
@onready var blast_area : Area2D = $Instrument/Attack/Blast
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	attack_animation.animation_finished.connect(_on_attack_finished)
	blast_area.hit_ghost_enemy.connect(_hit_enemy)
	pass

func _physics_process(delta):
	
	if Input.is_action_pressed("play_instrument"):
		attack_animation.play("blast")
		pass
	var direction_y = Input.get_axis("move_up", "move_down")
	if direction_y:
		velocity.y = direction_y * SPEED

	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED

	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _on_attack_finished(anim_name: String):
	if anim_name == "blast":
		attack_animation.play("RESET")
	pass

func _hit_enemy():
	print("enemy hit")
