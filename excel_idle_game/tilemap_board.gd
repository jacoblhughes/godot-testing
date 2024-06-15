extends TileMapBase
#BOARD
var river_cells = []

@export var game : Node2D

func _ready():
	river_cells = get_used_cells_by_id(0,0,Vector2i(0,1),-1)

	pass

func add_tiles():
	var initial_x_cell = GameManager.get_initial_size().x
	if GameManager.get_new_cells() > 0:
		for i in range(GameManager.get_new_cells()):
			for y in range(get_used_rect().size.y):
				set_cell(0,Vector2i(initial_x_cell+i,y),0,Vector2i(0,0))

			set_cell(0,Vector2i(initial_x_cell+i,get_used_rect().size.y-1),0,Vector2i(0,1))
	set_cell(0,Vector2i(1,-1),0,Vector2i(0,1))
	set_cell(0,Vector2i(get_used_rect().size.x-1,get_used_rect().size.y-1),0,Vector2i(0,1))

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		var coords_of_event = self.local_to_map(to_local(get_global_mouse_position()))
		var tile_data = get_cell_tile_data(0,coords_of_event,false)
		var base_data = tile_data.get_custom_data("base")
		if coords_of_event not in river_cells:
			if GameManager.get_tile_type_selection() == 'grass':
				set_cell(0,coords_of_event,0,Vector2i(0,2),0)
				game.get_board_tilemap_pattern()
			if GameManager.get_tile_type_selection() == 'gold' and game.get_score() >= 100:
				set_cell(0,coords_of_event,0,Vector2i(0,3),0)
				game.add_to_score(-100)
			if GameManager.get_tile_type_selection() == 'factory' and game.get_score() >= 10:
				var valid = false
				for item in get_surrounding_cells(coords_of_event):
					if item in river_cells:
						valid = true
				if valid:
					set_cell(0,coords_of_event,0,Vector2i(0,4),0)
					game.add_to_score(-10)

	if event is InputEventMouseButton and event.pressed and event.button_index == 2:
		Input.set_custom_mouse_cursor(null)
		GameManager.set_tile_type_selection("")
