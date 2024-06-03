extends Node2D

@export var tile_map : TileMap
@export var grid : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	tile_map.position.x += 26

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
