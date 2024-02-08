extends CharacterBody2D

@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var player_view = false
var should_be
var player
# Get the gravity from the project settings to be synced with RigidBody nodes.

func _ready():

	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_action_just_pressed("a") and should_be:

			player.on_npc_interact(%Marker2D.global_position)
			%Dialogue.trigger()
	pass

func _on_area_2d_body_entered(body):
	if body is Player and player_view:
		should_be = true
		sprite.material.set_shader_parameter("line_thickness", 1.0)
		player = body
	else:
		should_be = false
		player = null
func being_viewed():
	player_view=true


func stop_being_viewed():
	sprite.material.set_shader_parameter("line_thickness", 0.0)
	player_view=false
#	sprite.material.set_shader_parameter("line_thickness", 0.0)
