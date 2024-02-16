extends Node2D

var sound_files = ["res://sounds/C.wav", "res://sounds/E.wav", "res://sounds/G.wav", "res://sounds/C2.wav"]
var wall_elements
var ball_elements
var grav_elements
var ball_instance_scene = preload("res://generic/ball.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	wall_elements = get_tree().get_nodes_in_group("wall")
	load_sounds_and_assign_to_walls()
	ball_elements = get_tree().get_nodes_in_group("ball")
	for element in ball_elements:
		element.wall_collision_and_split.connect(_on_wall_collision_and_split)
		pass
	grav_elements = get_tree().get_nodes_in_group("gravity")
	pass


func _on_wall_collision_and_split(pos,vel,split_value):

	var ball_instance = ball_instance_scene.instantiate()
	await get_tree().create_timer(1.5).timeout
	ball_instance.position = pos
	ball_instance.linear_velocity = vel
	ball_instance.wall_collision_and_split.connect(_on_wall_collision_and_split)
	add_child.call_deferred(ball_instance,true)

func load_sounds_and_assign_to_walls():
	for i in range(wall_elements.size()):
		var sound_index = i % sound_files.size()
		var sound = load(sound_files[sound_index])
		if sound:
			var audio_player = AudioStreamPlayer.new()
			audio_player.stream = sound
			wall_elements[i].add_child(audio_player,true)
		else:
			print("Failed to load sound:", sound_files[sound_index])
