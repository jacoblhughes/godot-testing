extends Node2D

@onready var player = null
@onready var start = $Start
@onready var exit = $Exit
@onready var death_zone = $DeathZone
@export var next_level : PackedScene = null
var respawn_position
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_first_node_in_group("player")
	respawn_position = start.get_spawn_position()
	if player != null:
		player.global_position = respawn_position
	var traps = get_tree().get_nodes_in_group("traps")
	for trap in traps:
		trap.touched_player.connect(_on_trap_touched_player)
	#add the quit and stuff from the other one
	var waters = get_tree().get_nodes_in_group("water")
	for water in waters:
		water.player_entered.connect(_on_water_entered)
	for water in waters:
		water.player_exited.connect(_on_water_exited)
	exit.body_entered.connect(_on_exit_body_entered)
	death_zone.body_entered.connect(_on_death_zone_body_entered)
	var checkpoints = get_tree().get_nodes_in_group("checkpoint")
	for checkpoint in checkpoints:
		checkpoint.checkpoint_touched.connect(_on_checkpoint_entered)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
	pass


func _on_death_zone_body_entered(body):
	reset_player()
	pass # Replace with function body.

func _on_trap_touched_player():
	reset_player()
	pass
	
func reset_player():
	player.velocity = Vector2.ZERO
	player.global_position = respawn_position

func _on_exit_body_entered(body):
	if body is Player:
		exit.animate()
		player.active = false
		await get_tree().create_timer(1.5).timeout
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

func _on_character_entered():
	print("HERERERE")

func _on_checkpoint_entered(pos):
	respawn_position=pos