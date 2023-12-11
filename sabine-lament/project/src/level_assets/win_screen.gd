extends Control
var button : Button

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button.release_focus()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed('jump') and $Button.has_focus():
			_on_button_pressed()


func _on_button_pressed():
	get_tree().change_scene_to_file("res://src/levels/start_menu.tscn")
	pass # Replace with function body.


func _on_visibility_changed():
	if self.visible:
		$Button.grab_focus()
		
	pass # Replace with function body.
