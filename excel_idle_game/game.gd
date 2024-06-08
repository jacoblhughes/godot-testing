extends Node2D

@export var cover : Node2D
@export var grid : Node2D
@export var menu : CanvasLayer
@export var hud : CanvasLayer
@export var board : Node2D
@export var cover_tilemap : TileMap
@export var board_tilemap : TileMap
@export var navigation_region : NavigationRegion2D

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
		cover.hide()
	
	board_tilemap.add_tiles()
	cover_tilemap.add_tiles()
	navigation_region.bake_navigation_polygon()
	pass # Replace with function body.


func _process(delta):
	pass
