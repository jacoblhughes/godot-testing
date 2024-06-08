extends Node2D

@export var cover : Node2D
@export var grid : Node2D
@export var menu : CanvasLayer
@export var hud : CanvasLayer
@export var board : Node2D
<<<<<<< HEAD
@export var cover_tilemap : TileMap
@export var board_tilemap : TileMap
@export var navigation_region : NavigationRegion2D

=======
@export var cover : Node2D
# Called when the node enters the scene tree for the first time.
>>>>>>> a19b26ec2fb79031fc82a3f8a6e4246651241167
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
<<<<<<< HEAD
		cover.hide()
	
	board_tilemap.add_tiles()
	cover_tilemap.add_tiles()
	navigation_region.bake_navigation_polygon()
=======
		cover.show()

	#cells_tile_map.position.x += 26

>>>>>>> a19b26ec2fb79031fc82a3f8a6e4246651241167
	pass # Replace with function body.


func _process(delta):
	pass
