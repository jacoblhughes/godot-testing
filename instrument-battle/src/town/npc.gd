extends CharacterBody2D

@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var player_view = false
# Get the gravity from the project settings to be synced with RigidBody nodes.

func _physics_process(delta):

	pass

func _on_area_2d_body_entered(body):
	if body is Player and player_view:
		sprite.material.set_shader_parameter("line_thickness", 1.0)

func being_viewed():
	player_view=true


func stop_being_viewed():
	sprite.material.set_shader_parameter("line_thickness", 0.0)
	player_view=false
#	sprite.material.set_shader_parameter("line_thickness", 0.0)
