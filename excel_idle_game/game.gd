extends Node2D

@export var cells_tile_map : TileMap
@export var grid : Node2D
@export var menu : CanvasLayer
@export var hud : CanvasLayer
@export var board : Node2D
@export var cover : Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	if menu.is_visible():
		menu.hide()
	if hud.is_visible():
		hud.hide()
	if board.is_visible():
		board.hide()
	if not cover.is_visible():
		cover.show()

	#cells_tile_map.position.x += 26

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
