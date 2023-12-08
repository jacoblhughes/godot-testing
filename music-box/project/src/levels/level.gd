extends Node2D

@onready var player = null
@onready var start = $Start
@onready var finish = $Finish
@onready var death_zone = $DeathZone
@export var debug = false
@export var next_level : PackedScene = null
@export var level_number_for_powers : int = 1
@export var checkpoint_spawn : int = 0
@onready var UI : CanvasLayer
var respawn_position
var checkpoint_array =[]
@export var last_level = false
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_first_node_in_group("player")
	UI = $UI

	var traps = get_tree().get_nodes_in_group("traps")
	for trap in traps:
		trap.touched_player.connect(_on_trap_touched_player)
	#add the quit and stuff from the other one
	var waters = get_tree().get_nodes_in_group("water")
	for water in waters:
		water.player_entered.connect(_on_water_entered)
	for water in waters:
		water.player_exited.connect(_on_water_exited)
	finish.player_finish.connect(_on_finish_body_entered)
	death_zone.body_entered.connect(_on_death_zone_body_entered)
	var checkpoints = get_tree().get_nodes_in_group("checkpoint")
	for checkpoint in checkpoints:
		checkpoint.checkpoint_touched.connect(_on_checkpoint_entered)
		checkpoint_array.append(checkpoint.get_checkpoint_position())
	
	if debug == true:
		respawn_position = checkpoint_array[checkpoint_spawn]
		player.unlock_power(level_number_for_powers+1)
	else:
		respawn_position = start.get_spawn_position()
		player.unlock_power(level_number_for_powers)
	pass # Replace with function body.
	player.global_position = respawn_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
	pass


func _on_death_zone_body_entered(body):
	AudioManager.play_sfx('hurt')
	reset_player()
	pass # Replace with function body.

func _on_trap_touched_player():
	AudioManager.play_sfx('hurt')
	reset_player()
	pass
	
func reset_player():

	player.velocity = Vector2.ZERO
	player.global_position = respawn_position

func _on_finish_body_entered(body):
	if body is Player:
		player.active = false
		await get_tree().create_timer(1.5).timeout
		if last_level:
			UI.show_win_screen(true)
			pass
		else:
			get_tree().change_scene_to_packed(next_level)

func _on_water_entered(body):

	if body is Player:
		player.velocity.y = 0
		player.gravity = 100
		player.under_water = true

func _on_water_exited(body):

	if body is Player:
		player.gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
		player.under_water = false


func _on_checkpoint_entered(pos):
	respawn_position=pos

