extends TileMap

@export var player : CharacterBody2D

func _ready():
	call_deferred("_call_deferred")

func _call_deferred():
	for child in get_children():
		var child_coord: Vector2i = local_to_map(child.position)
		child.set_coords(child_coord)
		child.player = player
		# Set child index to the grid's cell
		#set_cell(0, child_coord, 0, Vector2i.ZERO, child.get_index())

#func do_something(child_coord: Vector2i):
		## Get the node's index stored in the cell
		#var child_index: int = get_cell_alternative_tile(0, child_coord)
		#var child_node: Node2D = get_child(child_index)
