extends TileMapBase
#COVER
func add_tiles():
	var initial_x_cell = GameManager.get_initial_size().x
	print(initial_x_cell)
	print(get_used_rect().size.y)
	print(GameManager.get_final_tilemap_size())
	if GameManager.get_new_cells() > 0:
		for i in range(GameManager.get_new_cells()):
			for y in range(get_used_rect().size.y):
				set_cell(0,Vector2i(initial_x_cell+i,y),0,Vector2i(0,0))
