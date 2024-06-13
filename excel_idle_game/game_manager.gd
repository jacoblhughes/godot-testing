extends Node

var window_height = 1080/5
var cell_size = 0
var game_enabled : bool = true
var new_cells = 0
var tilemap_final_size : Vector2i = Vector2i.ZERO
var tile_size : Vector2i = Vector2i.ZERO
var tilemap_initial_size : Vector2i = Vector2i.ZERO
var tile_type : String = ""
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
	game_enabled = val

func get_game_enabled():
	return game_enabled

func set_new_cells(val):
	new_cells = val

func get_new_cells():
	return new_cells

func set_final_tilemap_size(val):
	tilemap_final_size = val

func get_final_tilemap_size():
	return tilemap_final_size

func set_tile_size(val):
	tile_size = val

func get_tile_size():
	return tile_size

func set_initial_size(val):
	tilemap_initial_size = val

func get_initial_size():
	return tilemap_initial_size

func set_tile_type_selection(val):
	tile_type = val

func get_tile_type_selection():
	return tile_type
