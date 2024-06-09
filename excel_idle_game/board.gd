extends Node2D

@export var tile_map : TileMap
@export var timer : Timer
@export var byte_scene : PackedScene
var final_position : Vector2
@export var main : Node
@export var game : Node2D
@export var navigation_region : NavigationRegion2D

# Called when the node enters the scene tree for the first time.
func _ready():
	main.window_resized.connect(_on_window_resized)

func _on_window_resized():
	var final_position_coord = Vector2i(GameManager.get_final_tilemap_size().x,GameManager.get_final_tilemap_size().y+1)
	final_position = tile_map.map_to_local(final_position_coord)
	timer.timeout.connect(_on_timer_timeout)
	timer.start()
	navigation_region.bake_navigation_polygon()
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_timer_timeout():
	print('here')
	var byte = byte_scene.instantiate()
	byte.tile_map = tile_map
	byte.position = to_global(tile_map.map_to_local(Vector2i(1,-1)) + tile_map.position)
	byte.end_position = final_position
	byte.clicked_on.connect(game._add_to_score)
	add_child(byte)
	pass
