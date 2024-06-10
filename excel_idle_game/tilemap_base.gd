extends TileMap
class_name TileMapBase

@export var menu : CanvasLayer
@export var hud : CanvasLayer
@export var other_node : Node2D
@export var home_node : Node2D
@export_enum("Board:0","Cover:1") var node_version : int
signal cells_added

var menu_cells = {"Menu":Vector2i(0,0),"Visibility":Vector2i(1,0)}
var menu_cell_clicked = 0

func _ready():

	pass

#BASE

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if node_version == 0:
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
		if node_version == 1:
			if get_parent().visible == true:
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
	if node_version == 0:

		home_node.call_deferred("hide")
		other_node.call_deferred("show")
		if menu.is_visible():
			menu.hide()
		if hud.is_visible():
			hud.hide()
	if node_version == 1:

		home_node.call_deferred("hide")
		other_node.call_deferred("show")
		if menu.is_visible():
			menu.hide()
		if not hud.is_visible():
			hud.show()
