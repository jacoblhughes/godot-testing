extends Node

var window_height = 1080/5
var cell_size = 0
var game_enabled = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_window_height(val):
	window_height = val

func get_window_height():
	return window_height

func set_cell_size(val):
	cell_size = val

func get_cell_size():
	return cell_size

func set_game_enabled(val):
	game_enabled == val

func get_game_enabled():
	return game_enabled
