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
var final_rotation = Vector3(0, 0, 0)
func _ready():
	var starting_position = Vector3(0, 0, 0)
#	starting_position = make_sin_x_z(100, 100, 2, 10, starting_position)
	starting_position = make_sin_x_z(100, 100, 2, 10, starting_position)
	starting_position = make_loop(50, 100, 0.5, starting_position)
func make_sin_x_z(num_dominoes, wave_amplitude, wave_frequency, spacing, starting_position):
	var wave_length = num_dominoes
	var temp_starting_position = Vector3(0, 0, 0)
	for i in range(num_dominoes):
		var x = (i * spacing) + starting_position.x
		var y = 0 + starting_position.y
		var angle_rad = (float(i) / wave_length) * wave_frequency * 2 * PI
		var z = (sin(angle_rad) * wave_amplitude) + starting_position.z
		var new_position = Vector3(x, y, z)
		var domino_instance = domino_scene.instantiate()
		add_child(domino_instance)
		domino_instance.global_position = new_position

		if i < num_dominoes - 1:
			var next_x = ((i + 1) * spacing) + starting_position.x
			var next_y = 0 + starting_position.y
			var next_angle_rad = (float(i + 1) / wave_length) * wave_frequency * 2 * PI
			var next_z = (sin(next_angle_rad) * wave_amplitude) + starting_position.z
			var next_position = Vector3(next_x, next_y, next_z)
			var direction = (next_position - new_position).normalized()
			var target_position = new_position + direction
			domino_instance.look_at(target_position, Vector3.UP)
			final_rotation = domino_instance.rotation
		elif i == num_dominoes - 1:
			domino_instance.rotation = final_rotation
			temp_starting_position = domino_instance.global_position

	return temp_starting_position

func make_loop(num_dominoes, loop_radius, sideways_spacing, starting_position):
	var temp_starting_position = Vector3(0, 0, 0)
	for i in range(num_dominoes):
		var angle_rad = (float(i) / (num_dominoes - 1)) * 2 * PI  # Complete one full circle (2 * PI radians)
		var x = starting_position.x + cos(angle_rad) * loop_radius + i * sideways_spacing
		var y = starting_position.y + sin(angle_rad) * loop_radius
		var z = starting_position.z
		var new_position = Vector3(x, y, z)
		var domino_instance = domino_scene.instantiate()
		add_child(domino_instance)
		domino_instance.global_position = new_position

		if i < num_dominoes - 1:
			var next_angle_rad = (float(i + 1) / (num_dominoes - 1)) * 2 * PI
			var next_x = starting_position.x + cos(next_angle_rad) * loop_radius + (i + 1) * sideways_spacing
			var next_y = starting_position.y + sin(next_angle_rad) * loop_radius
			var next_z = starting_position.z
			var next_position = Vector3(next_x, next_y, next_z)
			var direction = (next_position - new_position).normalized()
			var target_position = new_position + direction
			domino_instance.look_at(target_position, Vector3.UP)
			final_rotation = domino_instance.rotation
		elif i == num_dominoes - 1:
			domino_instance.rotation = final_rotation
			temp_starting_position = domino_instance.global_position

	return temp_starting_position
