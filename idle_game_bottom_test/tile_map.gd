extends TileMap

@export var player : CharacterBody2D

func _ready():
	call_deferred("_call_deferred")

func _call_deferred():
	for child in get_children():
		var child_coord: Vector2i = local_to_map(child.position)
		child.set_coords(child_coord)
		child.player = player

		if child_coord.y == 0:
			child.type = 2
			child.update_direction_and_cell()

		if child_coord.x == 0:
			child.type = 4
			child.update_direction_and_cell()

		if child_coord.y == 7:
			child.type = 6
			child.update_direction_and_cell()

		if child_coord.x == 59:
			child.type = 8
			child.update_direction_and_cell()

		if child_coord == Vector2i(0,0):
			child.type = 3
			child.update_direction_and_cell()

		if child_coord == Vector2i(0,7):
			child.type = 5
			child.update_direction_and_cell()

		if child_coord == Vector2i(59,0):
			child.type = 9
			child.update_direction_and_cell()

		if child_coord == Vector2i(59,7):
			child.type = 7
			child.update_direction_and_cell()

		if get_cell_atlas_coords(0,child_coord,false) == Vector2i(3,0):
			print(true)
			child.type = 10
			pass
