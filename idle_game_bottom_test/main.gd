extends Node

signal window_resized
var focus_lost = false

func _ready():
	# Start the game maximized
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)

	# Defer the resizing to allow the window to maximize first
	call_deferred("_resize_window")

func _notification(what):
	if what == NOTIFICATION_WM_WINDOW_FOCUS_OUT or what == NOTIFICATION_WM_WINDOW_FOCUS_IN:
		print(NOTIFICATION_WM_WINDOW_FOCUS_IN)
		if what == NOTIFICATION_WM_WINDOW_FOCUS_OUT and GameManager.get_game_enabled():
			GameManager.set_game_enabled(false)
			print('out')
			print(GameManager.get_game_enabled())
		if what == NOTIFICATION_WM_WINDOW_FOCUS_IN and not GameManager.get_game_enabled():
			print('here')
			GameManager.set_game_enabled(true)
			print('in')
		
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
	GameManager.set_window_height(256)
	var window_height = GameManager.get_window_height()
	var window_position = Vector2(0,  DisplayServer.screen_get_usable_rect().size.y - window_height*3)
	DisplayServer.window_set_position(window_position)
	DisplayServer.window_set_size(Vector2(DisplayServer.screen_get_size().x, window_height))
	# Optionally, make the window always on top
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_ALWAYS_ON_TOP,true)
	window_resized.emit()
	print('window_resized')
