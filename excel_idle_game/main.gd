extends Node

signal window_resized

# Called when the node enters the scene tree for the first time.
func _ready():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)

	# Defer the resizing to allow the window to maximize first
	call_deferred("_resize_window")

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed('pc_reset'):
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("pc_quit"):
		get_tree().quit()

func _resize_window():

	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS,true)
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	var _taskbar_height = DisplayServer.screen_get_size().y - DisplayServer.screen_get_usable_rect().size.y
	#GameManager.set_window_height(DisplayServer.screen_get_usable_rect().size.y/5)
	#GameManager.set_window_height(256)
	#var window_height = GameManager.get_window_height()
	var window_height = 260
	var window_position = Vector2(0,  DisplayServer.screen_get_usable_rect().size.y - window_height - 59)
	DisplayServer.window_set_position(window_position)
	print(DisplayServer.screen_get_size())
	DisplayServer.window_set_size(Vector2(DisplayServer.screen_get_size().x - 22, window_height))
	# Optionally, make the window always on top
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_ALWAYS_ON_TOP,true)
	print(DisplayServer.screen_get_size().x)
	var length = DisplayServer.screen_get_size().x - 1920
	print(length)
	var new_cells = int(length / 64)
	print(new_cells)
	GameManager.set_new_cells(new_cells)
	print(new_cells)
	window_resized.emit()
