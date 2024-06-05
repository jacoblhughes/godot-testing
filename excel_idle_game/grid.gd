extends Node2D



var tilemap_size = Vector2()
var tile_size = Vector2()
func _ready():
	if get_parent().has_signal("cells_added"):
		get_parent().cells_added.connect(_on_cells_added)

func _draw():
	tilemap_size = get_parent().get_used_rect().size
	tile_size = get_parent().get_tileset().tile_size
	var color = Color('#d4d4d4') # RGB values range from 0 to 1 in Godot

	for y in range(tilemap_size.y):
		draw_line(Vector2(0, tile_size.y * y), Vector2( tilemap_size.x * tile_size.x ,tile_size.y * y), color)

	for x in range(tilemap_size.x):
		draw_line(Vector2(tile_size.x * x, 0), Vector2(tile_size.x * x, tilemap_size.y * tile_size.y), color)


func _process(delta):
	pass

func _on_cells_added():
	queue_redraw()