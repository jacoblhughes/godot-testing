extends Node2D

@export var cover : Node2D
@export var grid : Node2D
@export var menu : CanvasLayer
@export var hud : CanvasLayer
@export var board : Node2D

@export var cover_tilemap : TileMap
@export var board_tilemap : TileMap


var score = 0

func _ready():
	get_parent().window_resized.connect(_on_window_resized)

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



	pass # Replace with function body.


func _process(delta):
	pass
	
func _add_to_score():
	var new_score = score + 1
	score = new_score
	hud.update_score(score)
