extends TileMap

@export var menu : CanvasLayer
@export var hud : CanvasLayer
@export var cover_cells_node : Node2D
signal cells_added

var menu_cells = {"Menu":Vector2i(0,0),"Visibility":Vector2i(1,0)}
var menu_cell_clicked = 0

func _ready():

	get_parent().get_parent().get_parent().get_parent().window_resized.connect(_on_window_resized)


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

#GAME

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if get_parent().get_parent().visible == true:
			var coords_of_event = self.local_to_map(to_local(get_global_mouse_position()))
			if coords_of_event == menu_cells["Menu"]:
				menu_cell_clicked +=1
				if menu_cell_clicked >= 3:
					menu.show()
					menu_cell_clicked = 0
					hud.hide()
			if coords_of_event == menu_cells["Visibility"]:

				update_visibility()

func update_visibility():
	#for node in self.get_children():
		#node.visible = nodes_visible
	get_parent().get_parent().call_deferred("hide")
	cover_cells_node.call_deferred("show")
	if menu.is_visible():
		menu.hide()
	if hud.is_visible():
		hud.hide()
