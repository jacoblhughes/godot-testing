extends Node2D

@export var tile_map : TileMap
@export var timer : Timer
@export var byte_scene : PackedScene
var final_position : Vector2
@export var main : Node
@export var game : Node2D
@export var navigation_region : NavigationRegion2D
var grass_cells = []
var gold_cells = []
var factory_cells = []
@export var friend_scene : PackedScene
var friend_spawned = false
var friend
# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().tiles_added.connect(_on_tiles_added)

func _on_tiles_added():
	var final_position_coord = Vector2i(GameManager.get_final_tilemap_size().x-1,GameManager.get_final_tilemap_size().y)
	final_position = tile_map.map_to_local(final_position_coord)
	timer.timeout.connect(_on_timer_timeout)
	timer.start()
	navigation_region.bake_navigation_polygon()
	grass_cells = tile_map.get_used_cells_by_id(0,0,Vector2i(0,2),-1)
	gold_cells = tile_map.get_used_cells_by_id(0,0,Vector2i(0,3),-1)
	factory_cells = tile_map.get_used_cells_by_id(0,0,Vector2i(0,4),-1)
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_timer_timeout():
	_check_tile_types()
	pass

func _check_tile_types():
	grass_cells = tile_map.get_used_cells_by_id(0,0,Vector2i(0,2),-1)
	gold_cells = tile_map.get_used_cells_by_id(0,0,Vector2i(0,3),-1)
	factory_cells = tile_map.get_used_cells_by_id(0,0,Vector2i(0,4),-1)
	var gold_points = len(gold_cells)*5
	var grass_points = len(grass_cells)
	game.add_to_score(gold_points - grass_points)
	if len(grass_cells) >=4 and friend_spawned == false:
		var friend = friend_scene.instantiate()
		friend.position = to_global(tile_map.map_to_local(grass_cells[0]) + tile_map.position)
		friend_spawned = true
		add_child(friend)
	if len(grass_cells) < 4 and friend_spawned == true:
		friend.queue_free()
		friend_spawned = false
		
	_spawn_byte()

func _spawn_byte():
	var byte = byte_scene.instantiate()
	byte.tile_map = tile_map
	byte.position = to_global(tile_map.map_to_local(Vector2i(1,-1)) + tile_map.position)
	byte.end_position = final_position + Vector2(tile_map.get_tileset().tile_size.x/2,tile_map.get_tileset().tile_size.y/4)
	byte.clicked_on.connect(game.add_to_score.bind((max(1, 1 * len(factory_cells),1+len(factory_cells)))))
	add_child(byte)
