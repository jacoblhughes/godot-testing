extends TileMap

var tilemap_size = Vector2()

func _ready():
	tilemap_size = self.get_used_rect().size

func _draw():
	var color = Color(1.0, 0.0, 0.0) # RGB values range from 0 to 1 in Godot

	draw_set_transform(Vector2(), 0, tilemap_size)

	for y in range(tilemap_size.y):
		draw_line(Vector2(0, y), Vector2(tilemap_size.x, y), color)

	for x in range(tilemap_size.x):
		draw_line(Vector2(x, 0), Vector2(x, tilemap_size.y), color)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
