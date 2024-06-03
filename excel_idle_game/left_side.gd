extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():

	call_deferred("_call_deferred")

	pass # Replace with function body.

func _call_deferred():
	var i = 0
	for cell in get_tree().get_nodes_in_group("left_side_label"):
		cell.set_panel_text(24+i)
		i  += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
