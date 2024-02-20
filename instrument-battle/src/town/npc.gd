extends CharacterBody2D

@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D
@export var node_for_signal : Node2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var player_view = false
var should_be
var player
var paused = false
@export var has_quest = false
var quest_given = false
signal quest_start
var text_to_say : Array
# Get the gravity from the project settings to be synced with RigidBody nodes.

func _ready():
	print('npc just made')
	DialogueManager.completed.connect(_on_dialogue_completed)
	if node_for_signal:
		self.quest_start.connect(node_for_signal._on_npc_interaction)
		#####Could I better control how/why the NPC says what it says? In the process?
	if PlotManager.has_instrument == false:
		text_to_say = ["Find a way to fight, dummy!"]
	else:
		text_to_say = ["Okay, good luck."]
	pass # Replace with function body.

func _physics_process(delta):
	print(should_be, player_view)
	if !paused:
		if Input.is_action_just_pressed("a") and should_be:
			player.on_npc_interact(%Marker2D.global_position)
			player.paused=true
			paused = true
			DialogueManager.trigger(text_to_say)
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
	if has_quest and !quest_given and PlotManager.has_instrument:
		quest_given = true
		quest_start.emit()

