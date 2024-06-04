extends TileMap

signal cells_added

func _ready():
	get_parent().get_parent().window_resized.connect(_on_window_resized)
	
	
func _on_window_resized():
	var initial_x_cell = get_used_rect().size.x
	if GameManager.get_new_cells() > 0:
		for i in range(GameManager.get_new_cells()):
			for y in get_used_rect().size.y:
				set_cell(0,Vector2i(initial_x_cell+i,y),1,Vector2i(0,0))

	cells_added.emit()
	pass
	
func _draw():
	pass
	

func _process(delta):
	pass
