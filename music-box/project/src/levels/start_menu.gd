extends Control

var button : Button
# Called when the node enters the scene tree for the first time.
func _ready():
	$StartButton.grab_focus()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed('jump'):
		if button == $StartButton:
			_on_start_button_pressed()
		elif button == $QuitButton:
			_on_quit_button_pressed()
	pass


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://src/levels/level_1.tscn")
	pass # Replace with function body.


func _on_quit_button_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_start_button_focus_entered():

	button = $StartButton
	pass # Replace with function body.


func _on_quit_button_focus_entered():
	button = $QuitButton
	pass # Replace with function body.
