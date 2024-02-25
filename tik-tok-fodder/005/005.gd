#extends Node3D
#
#var domino_scene = preload("res://005/domino_scene.tscn")
#var num_dominoes = 50
## Called when the node enters the scene tree for the first time.
#func _ready():
#	var wave_amplitude = 5  # Adjust the amplitude of the wave
#	var wave_frequency = 1  # Adjust the frequency of the wave
#
#	for i in range(num_dominoes):
#		var x = i * 2  # Spacing between each domino
#		var z = sin(deg_to_rad(i * wave_frequency * 10)) * wave_amplitude
#		var domino_scene_instance = domino_scene.instantiate()
#		get_node("Dominoes").add_child.call_deferred(domino_scene_instance)
#		domino_scene_instance.global_position = Vector3(x, 0, z)
#	pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

extends Node3D

var domino_scene = preload("res://005/domino_scene.tscn")


func _ready():
	var num_dominoes = 100
	var wave_amplitude = 100  # Adjust the amplitude of the wave
	var wave_frequency = 2    # Adjust the frequency of the wave
	var wave_length = num_dominoes  # Set the wave length to the total number of dominoes
	var spacing = 10  # Spacing between each domino

	var previous_position = Vector3(0, 0, 0)
	for i in range(num_dominoes):
		var x = i * spacing
		var angle_rad = (float(i) / wave_length) * wave_frequency * 2 * PI
		var z = sin(angle_rad) * wave_amplitude
		var new_position = Vector3(x, 0, z)
		var domino_instance = domino_scene.instantiate()
		add_child(domino_instance)
		domino_instance.global_position = new_position

		if i < num_dominoes - 1:
			var next_x = (i + 1) * spacing
			var next_angle_rad = (float(i + 1) / wave_length) * wave_frequency * 2 * PI
			var next_z = sin(next_angle_rad) * wave_amplitude
			var next_position = Vector3(next_x, 0, next_z)
			var direction = (next_position - new_position).normalized()
			var target_position = new_position + direction
			domino_instance.look_at(target_position, Vector3.UP)





		
#	for i in range(num_dominoes):
#		var x = i * 10  # Spacing between each domino
#		var y = sin(deg_to_rad(i * wave_frequency * 10)) * wave_amplitude
#		var domino_instance = domino_scene.instantiate()
#		add_child(domino_instance)
#		domino_instance.global_transform.origin = Vector3(x, y, 0)  # Positioning on the X-Y plane




func _process(delta):
	pass
