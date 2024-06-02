extends Node2D

@export var tile_map : TileMap
@export var collector : CharacterBody2D
var max_garbage = 1
var current_garbage : Array = []

func _ready():
	print(tile_map.get_used_cells(3))
	print(tile_map.get_cell_alternative_tile(3,Vector2i(1,1),false))
	print(tile_map.get_cell_alternative_tile(3,Vector2i(2,2),false))

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_check_for_current_garbage()

	pass

func _check_for_current_garbage():
	for location in tile_map.get_used_cells(3):
		if not current_garbage.has(location):
			current_garbage.append(location)

	collector.provide_garbage(current_garbage)

