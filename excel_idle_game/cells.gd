extends TileMap

func _ready():
	var initial_x_cell = get_used_rect().size.x

	for i in range(GameManager.get_new_cells()):
		if i > 0:
			for y in get_used_rect().size.y:
				set_cell(0,Vector2i(initial_x_cell+i,y),0,Vector2i(0,0))
				print(i)

	#self.set_cell(0,)
	pass
func _draw():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
