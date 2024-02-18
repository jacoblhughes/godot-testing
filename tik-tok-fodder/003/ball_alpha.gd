extends Node2D

var markers = []  # Array to store the Marker2D nodes
var current_target = 0  # Index of the current target marker
var tween_duration = 1.0  # Duration of the tween in seconds



func _ready():
	# Find the Marker2D nodes in the scene and store them in the markers array
	for marker in get_tree().get_nodes_in_group("markers"):
		markers.append(marker)
	# Start the first tween
	move_to_next_marker()

func move_to_next_marker():

	if markers.size() > 0 and current_target< markers.size():
		var start_position = global_position
		var end_position = markers[current_target].get_node("Marker2D").global_position
		var tween = get_tree().create_tween()
		tween.finished.connect(_on_Tween_tween_completed)
		tween.tween_property($Sprite2D, "global_position", end_position, 1)

#		tween.interpolate_property(self, "global_position", start_position, end_position, tween_duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
#		tween.start()



func _on_Tween_tween_completed():
	markers[current_target].get_node("AudioStreamPlayer").play()
	current_target = (current_target + 1)
	move_to_next_marker()  # Start the next tween when the current one completes
