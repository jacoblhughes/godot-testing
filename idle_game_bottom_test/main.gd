extends Node

signal window_resized
var window_height = 200

func _ready():
	# Start the game maximized
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
	
	# Defer the resizing to allow the window to maximize first
	call_deferred("_resize_window")

func _process(delta):
	if Input.is_action_just_pressed('pc_reset'):
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("pc_quit"):
		get_tree().quit()

func _resize_window():
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS,true)
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	var taskbar_height = DisplayServer.screen_get_size().y - DisplayServer.screen_get_usable_rect().size.y
	var window_position = Vector2(0,  DisplayServer.screen_get_usable_rect().size.y - window_height)
	DisplayServer.window_set_position(window_position)
	DisplayServer.window_set_size(Vector2(DisplayServer.screen_get_size().x, window_height))
	# Optionally, make the window always on top
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_ALWAYS_ON_TOP,true)
	window_resized.emit()
