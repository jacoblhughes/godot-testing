extends Node2D



var markers = []  # Array to store the Marker2D nodes
var sound_target = 0.0  # Index of the current target marker
var marker_target = 0.0
var tween_duration = 2.0  # Duration of the tween in seconds
var bpm = 75  # Example BPM value
var current_audio_player

var C1 = "res://sounds/C1.wav"
var C1s = "res://sounds/C1#.wav"  # C#1
var D1 = "res://sounds/D1.wav"
var D1s = "res://sounds/D1#.wav"  # D#1
var E1 = "res://sounds/E1.wav"
var F1 = "res://sounds/F1.wav"
var F1s = "res://sounds/F1#.wav"  # F#1
var G1 = "res://sounds/G1.wav"
var G1s = "res://sounds/G1#.wav"  # G#1
var A1 = "res://sounds/A1.wav"
var A1s = "res://sounds/A1#.wav"  # A#1
var B1 = "res://sounds/B1.wav"
var C2 = "res://sounds/C2.wav"
var C2s = "res://sounds/C2#.wav"  # C#2
var D2 = "res://sounds/D2.wav"
var D2s = "res://sounds/D2#.wav"  # D#2
var E2 = "res://sounds/E2.wav"
var F2 = "res://sounds/F2.wav"
var F2s = "res://sounds/F2#.wav"  # F#2
var G2 = "res://sounds/G2.wav"
var G2s = "res://sounds/G2#.wav"  # G#2
var A2 = "res://sounds/A2.wav"
var A2s = "res://sounds/A2#.wav"  # A#2
var B2 = "res://sounds/B2.wav"
var C3 = "res://sounds/C3.wav"

var whole_note_duration = 240.0 / bpm
var half_note_duration = whole_note_duration / 2.0
var quarter_note_duration = whole_note_duration / 4.0
var eighth_note_duration = whole_note_duration / 8.0
var sixteenth_note_duration = whole_note_duration / 16.0

var sound_files = [
	{"note": E2, "duration": eighth_note_duration},
	{"note": E2, "duration": eighth_note_duration},
	{"note": E2, "duration": eighth_note_duration},
	{"note": "rest", "duration": eighth_note_duration},
	{"note": C2, "duration": eighth_note_duration},
	{"note": E2, "duration": eighth_note_duration},
	{"note": G2, "duration": eighth_note_duration},
	{"note": "rest", "duration": eighth_note_duration},
	{"note": G1, "duration": quarter_note_duration},
	{"note": "rest", "duration": eighth_note_duration},
	{"note": C2, "duration": eighth_note_duration},
	{"note": "rest", "duration": eighth_note_duration},
	{"note": G1, "duration": eighth_note_duration},
	{"note": "rest", "duration": eighth_note_duration},
	{"note": E1, "duration": eighth_note_duration},
	{"note": "rest", "duration": eighth_note_duration},
	{"note": A1, "duration": eighth_note_duration},
	{"note": B1, "duration": eighth_note_duration},
	{"note": A1s, "duration": eighth_note_duration},
	{"note": A1, "duration": eighth_note_duration},
	{"note": "rest", "duration": eighth_note_duration},
	{"note": G1, "duration": quarter_note_duration},
	{"note": "rest", "duration": eighth_note_duration},
	{"note": E2, "duration": eighth_note_duration},
	{"note": G2, "duration": eighth_note_duration},
	{"note": A2, "duration": eighth_note_duration},
	{"note": F2, "duration": eighth_note_duration},
	{"note": G2, "duration": eighth_note_duration},
	{"note": E2, "duration": eighth_note_duration},
	{"note": C2, "duration": eighth_note_duration},
	{"note": D2, "duration": eighth_note_duration},
	{"note": B1, "duration": quarter_note_duration}
]

func _ready():
	for marker in get_node("Markers").get_children():
		markers.append(marker)
	load_sounds_and_assign_to_walls()
	first_tween()

func first_tween():
#	if %Start.has_node("AudioStreamPlayer"):
#		current_audio_player = %Start.get_node("AudioStreamPlayer")
##		current_audio_player.stream.loop_mode = 1  # Loop the current note
#		current_audio_player.play()
	var tween = get_tree().create_tween()
	tween.finished.connect(_on_first_tween_completed)
	var end_position = markers[0].get_node("Marker2D").global_position
	tween.tween_property(%Ball1, "global_position", end_position, tween_duration)

	
func _on_first_tween_completed():
	move_to_next_marker()
	pass

func move_to_next_marker():

	if sound_files.size() > 0 and marker_target+1 < markers.size():
		print(sound_files[sound_target])
		if current_audio_player:
			current_audio_player.stop()
#			current_audio_player.stream.loop_mode = 0
		if sound_files[sound_target]['note'] == "rest":
#			var tween = get_tree().create_tween()
#			tween.finished.connect(_on_some_tween_completed)
#			var original_color = %Ball1.modulate
#			tween.tween_property(%Ball1, "modulate", Color.BLUE, tween_duration/4).set_ease(Tween.EASE_OUT)
#			tween.tween_property(%Ball1, "scale", Vector2(2,2), tween_duration/4).set_ease(Tween.EASE_OUT)
#			tween.tween_property(%Ball1, "scale", Vector2(1,1), tween_duration/4).set_ease(Tween.EASE_OUT)
#			tween.tween_property(%Ball1, "modulate", original_color, tween_duration/4).set_ease(Tween.EASE_OUT)
			var start_position = markers[marker_target].get_node("Marker2D").global_position
			var end_position = markers[marker_target+1].get_node("Marker2D").global_position
			var half_way = (start_position+end_position)/2
			var tween = get_tree().create_tween()
			tween.finished.connect(_on_some_tween_completed)
			tween.tween_property(%Ball1, "global_position", half_way, tween_duration).set_ease(Tween.EASE_OUT)
		else:
		
			if markers[marker_target].has_node("AudioStreamPlayer"):
				current_audio_player = markers[marker_target].get_node("AudioStreamPlayer")
		#		current_audio_player.stream.loop_mode = 1  # Loop the current note
				current_audio_player.play()
			if sound_target < sound_files.size():
				tween_duration = sound_files[sound_target]['duration']
			else:
				tween_duration = 1
			var start_position = global_position
			marker_target +=1
			var end_position = markers[marker_target].get_node("Marker2D").global_position
			var tween = get_tree().create_tween()
			tween.finished.connect(_on_some_tween_completed)
			tween.tween_property(%Ball1, "global_position", end_position, tween_duration).set_ease(Tween.EASE_OUT)
		sound_target+=1
		
func _on_some_tween_completed():
	move_to_next_marker()
	
func load_sounds_and_assign_to_walls():
	var j = 0
	for i in range(sound_files.size()-1):
		if j<markers.size():
			if sound_files[i]['note'] == "rest":
				pass
			else:
				var sound = load(sound_files[i]['note'])
				if sound:
					var audio_player = AudioStreamPlayer.new()
					audio_player.stream = sound
					markers[j].add_child(audio_player,true)
					j+=1
				else:
					print("Failed to load sound:", sound_files[i])
