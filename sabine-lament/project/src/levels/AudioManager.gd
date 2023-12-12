extends Node

var hurt = preload("res://src/audio/hurt.wav")
var jump = preload("res://src/audio/jump.wav")
# Called when the node enters the scene tree for the first time.
func play_sfx(sfx_name : String):

	var stream = null
	if sfx_name == 'hurt':
		stream = hurt
	elif sfx_name == 'jump':
		stream = jump
	else:
		print("Invalid")
		return
	
	var asp = AudioStreamPlayer.new()
	asp.stream = stream
	asp.name = "SFX"
	add_child(asp)
	asp.play()
	await asp.finished
	asp.queue_free()
	pass
