extends Node2D

@export var cover : Node2D
@export var grid : Node2D
@export var menu : CanvasLayer
@export var hud : CanvasLayer
@export var board : Node2D

@export var cover_tilemap : TileMap
@export var board_tilemap : TileMap

signal tiles_added

var score = 250
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

	board_tilemap.add_tiles()
	cover_tilemap.add_tiles()

	tiles_added.emit()


	pass # Replace with function body.


func _process(delta):
	pass

func add_to_score(val):
	var new_score = score + val
	score = new_score
	hud.update_score(score)

func get_score():
	return score
