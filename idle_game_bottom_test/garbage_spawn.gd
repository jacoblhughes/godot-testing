extends Node2D

@export var garbage_scene : PackedScene
@export var tile_map : TileMap
var max_garbage = 1

func _ready():
	print(tile_map.get_cell_source_id(0,Vector2i(1,1),false))
	#_check_and_spawn_garbage()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#var test = TileMap.new()
	#test.local_to_map()
	pass
