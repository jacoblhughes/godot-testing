extends TileMapBase
#BOARD
func add_tiles():
	var initial_x_cell = GameManager.get_initial_size().x
	if GameManager.get_new_cells() > 0:
		for i in range(GameManager.get_new_cells()):
			for y in range(get_used_rect().size.y):
				set_cell(0,Vector2i(initial_x_cell+i,y),0,Vector2i(0,0))

			set_cell(0,Vector2i(initial_x_cell+i,get_used_rect().size.y-1),0,Vector2i(0,1))
	set_cell(0,Vector2i(1,-1),0,Vector2i(0,1))
	set_cell(0,Vector2i(get_used_rect().size.x-1,get_used_rect().size.y-1),0,Vector2i(0,1))
