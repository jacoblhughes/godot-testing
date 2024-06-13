extends CanvasLayer

@export var close_menu_button : Button
@export var quit_button : Button
@export var hud : CanvasLayer
@export var grass_button : Button
@export var gold_button : Button
@export var factory_button : Button
@export var grass_icon : AtlasTexture
@export var gold_icon : AtlasTexture
@export var factory_icon : AtlasTexture
# Called when the node enters the scene tree for the first time.
func _ready():
	visibility_changed.connect(_on_visibility_changed)
	grass_button.button_up.connect(_on_tile_type_button_pressed.bind('grass'))
	gold_button.button_up.connect(_on_tile_type_button_pressed.bind('gold'))
	factory_button.button_up.connect(_on_tile_type_button_pressed.bind('factory'))

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
	close()

func close():
	self.hide()


func _on_quit_button_pressed():

	get_tree().quit()

func _unhandled_input(event) -> void:
	pass

func _on_tile_type_button_pressed(type):
	if type == 'grass':
		Input.set_custom_mouse_cursor(grass_icon,0,Vector2(32,10))
		GameManager.set_tile_type_selection(type)
		close()
		return
	if type == 'gold':
		Input.set_custom_mouse_cursor(gold_icon,0,Vector2(32,10))
		GameManager.set_tile_type_selection(type)
		close()
		return
	if type == 'factory':
		Input.set_custom_mouse_cursor(factory_icon,0,Vector2(32,10))
		GameManager.set_tile_type_selection(type)
		close()
		return
