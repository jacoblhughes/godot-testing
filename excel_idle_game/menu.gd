extends CanvasLayer

@export var close_menu_button : Button
@export var quit_button : Button
@export var hud : CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	visibility_changed.connect(_on_visibility_changed)

func _on_visibility_changed():
	if visible:
		close_menu_button.button_up.connect(_on_close_menu_button_pressed)
		quit_button.button_up.connect(_on_quit_button_pressed)

	else:
		if close_menu_button.button_up.is_connected(_on_close_menu_button_pressed):
			close_menu_button.button_up.disconnect(_on_close_menu_button_pressed)
		if quit_button.button_up.is_connected(_on_quit_button_pressed):
			quit_button.button_up.disconnect(_on_quit_button_pressed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_close_menu_button_pressed():
	self.hide()

func _on_quit_button_pressed():
	print('here')
	get_tree().quit()

func _unhandled_input(event) -> void:
	pass
