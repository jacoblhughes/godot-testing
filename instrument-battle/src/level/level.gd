extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
#	%UI/Control/Label.text = str(0)
	pass # Replace with function body.


# Called every fleverame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
	pass
