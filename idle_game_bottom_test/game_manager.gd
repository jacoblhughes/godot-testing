extends Node

var window_height = 1080/5
var cell_size = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	call_deferred("_on_test")
func _on_test():
	#NavigationServer2D.map_set_cell_size(NavigationServer2D.get_maps()[0],32)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_window_height(val):
	window_height = val

func get_window_height():
	return window_height

func set_cell_size(val):
	cell_size = val

func get_cell_size():
	return cell_size
