extends Node

var window_height = 1080/5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_window_height(val):
	window_height = val

func get_window_height():
	return window_height
