extends CharacterBody2D

@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var player_view = false
var should_be
var player
var paused = false
@export var has_quest = false
var quest_given = false
signal quest_start
# Get the gravity from the project settings to be synced with RigidBody nodes.

func _ready():
	%Dialogue.completed.connect(_on_dialogue_completed)
	pass # Replace with function body.

func _physics_process(delta):

	if !paused:
		if Input.is_action_just_pressed("a") and should_be:
			player.on_npc_interact(%Marker2D.global_position)
			player.paused=true
			paused = true
			%Dialogue.trigger()
			if has_quest and !quest_given:
				quest_given = true
				quest_start.emit()
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

func _on_dialogue_completed():
	paused = false
	player.paused=false
