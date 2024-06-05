extends CanvasLayer

@export var close_menu_button : Button
@export var quit_button : Button
@export var hud : CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	close_menu_button.pressed.connect(_on_close_menu_button_pressed)
	quit_button.pressed.connect(_on_quit_button_pressed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_close_menu_button_pressed():
	self.hide()
	hud.show()

func _on_quit_button_pressed():
	print('here')
	get_tree().quit()
