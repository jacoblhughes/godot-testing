extends Node2D

@export var tile_map : TileMap
@export var timer : Timer
@export var marker : Marker2D
@export var byte_scene : PackedScene
var final_position : Vector2
@export var main : Node
# Called when the node enters the scene tree for the first time.
func _ready():
	main.window_resized.connect(_on_window_resized)
	
func _on_window_resized():
	var final_position_coord = Vector2i(GameManager.get_final_tilemap_size().x,GameManager.get_final_tilemap_size().y+1)
	final_position = tile_map.map_to_local(final_position_coord)
	timer.timeout.connect(_on_timer_timeout)
	timer.start()
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_timer_timeout():
	var byte = byte_scene.instantiate()
	byte.position = marker.position

	byte.end_position = final_position
	add_child(byte)
	pass
