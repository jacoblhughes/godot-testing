extends Node

var has_instrument = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_E):
		print(has_instrument)
	pass
	
func set_has_instrument(val):
	has_instrument = val
