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
	get_parent().tiles_added.connect(_on_tiles_added)

func _on_tiles_added():
	var final_position_coord = Vector2i(GameManager.get_final_tilemap_size().x-1,GameManager.get_final_tilemap_size().y)
	final_position = tile_map.map_to_local(final_position_coord)
	timer.timeout.connect(_on_timer_timeout)
	timer.start()
	navigation_region.bake_navigation_polygon()
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_timer_timeout():
	var byte = byte_scene.instantiate()
	byte.tile_map = tile_map
	byte.position = to_global(tile_map.map_to_local(Vector2i(1,-1)) + tile_map.position)
	byte.end_position = final_position + Vector2(tile_map.get_tileset().tile_size.x/2,tile_map.get_tileset().tile_size.y/4)
	byte.clicked_on.connect(game._add_to_score)
	add_child(byte)
	pass
