extends Node2D

var sound_files = ["res://sounds/C1.wav","res://sounds/C1.wav","res://sounds/D1.wav","res://sounds/C1.wav","res://sounds/F1.wav","res://sounds/C1.wav"]
var markers = []  # Array to store the Marker2D nodes
var current_target = 0  # Index of the current target marker
var tween_duration = 1.0  # Duration of the tween in seconds



func _ready():
	# Find the Marker2D nodes in the scene and store them in the markers array
	for marker in get_tree().get_nodes_in_group("markers"):
		markers.append(marker)
	load_sounds_and_assign_to_walls()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func load_sounds_and_assign_to_walls():
	for i in range(sound_files.size()):
		var sound_index = i % sound_files.size()
		var sound = load(sound_files[sound_index])
		if sound:
			var audio_player = AudioStreamPlayer.new()
			audio_player.stream = sound
			markers[i].add_child(audio_player,true)
		else:
			print("Failed to load sound:", sound_files[sound_index])
