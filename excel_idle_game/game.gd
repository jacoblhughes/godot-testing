extends Node2D

@export var cover : Node2D
@export var grid : Node2D
@export var menu : CanvasLayer
@export var hud : CanvasLayer
@export var board : Node2D

@export var cover_tilemap : TileMap
@export var board_tilemap : TileMap
var config = ConfigFile.new()
signal tiles_added
var excel_idle_cfg_path = "user://excel_idle.cfg"
var file_exists = false
var score = 0

const DEFAULT_FLOAT = -1.0

var tile_type = null

func _ready():
	get_parent().window_resized.connect(_on_window_resized)
	hud.update_score(score)


func _on_window_resized():
	if menu.is_visible():
		menu.hide()
	if hud.is_visible():
		hud.hide()
	if board.is_visible():
		board.hide()
	if not cover.is_visible():
		cover.show()



	file_exists = FileAccess.file_exists(excel_idle_cfg_path	)
	if(!file_exists):

		var file = FileAccess.open(excel_idle_cfg_path, FileAccess.WRITE_READ)
		file.store_string("[main]\n")
		file.store_string("\n")
		file.store_string("score=0\n")
		file.store_string("\n")
		file.close()
		config.load(excel_idle_cfg_path)
		board_tilemap.add_tiles()
		cover_tilemap.add_tiles()


	else:
		config.load(excel_idle_cfg_path)
		if config.get_value("main", "score", DEFAULT_FLOAT) != DEFAULT_FLOAT:
			pass
		else:
			config.set_value("main", "score",0.0)
			config.save(excel_idle_cfg_path)

		if config.get_value("main", "board_pattern", null) != null:
			pass
		else:
			config.set_value("main", "board_pattern",DEFAULT_FLOAT)
			config.save(excel_idle_cfg_path)

		if config.get_value("main", "cover_pattern", null) != null:
			pass
		else:
			config.set_value("main", "cover_pattern",DEFAULT_FLOAT)
			config.save(excel_idle_cfg_path)

		board_tilemap.set_pattern(0,Vector2i(0,-1),config.get_value("main","board_pattern",null))
		cover_tilemap.set_pattern(0,Vector2i(0,0),config.get_value("main","cover_pattern",null))
	var new_score = config.get_value("main", "score")
	score = new_score
	hud.update_score(score)
	tiles_added.emit()
	pass # Replace with function body.


func _process(delta):
	pass

func add_to_score(val):
	var new_score = score + val
	score = new_score
	if score < 0:
		for coord in board_tilemap.get_used_cells_by_id(0,0,Vector2i(0,2),-1):
			board_tilemap.set_cell(0,coord,0,Vector2i(0,0),0)
			score += 1
		pass
	hud.update_score(score)
	get_board_tilemap_pattern()
func get_score():
	return score

func get_board_tilemap_pattern():
	var current_board_pattern = board_tilemap.get_pattern(0,board_tilemap.get_used_cells(0))
	var current_cover_pattern = cover_tilemap.get_pattern(0,cover_tilemap.get_used_cells(0))
	config.set_value("main", "score",score)
	config.set_value("main", "board_pattern",current_board_pattern)
	config.set_value("main", "cover_pattern",current_cover_pattern)
	config.save(excel_idle_cfg_path)
