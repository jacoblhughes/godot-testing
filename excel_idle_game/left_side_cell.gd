extends Control

@export var label : Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_panel_text(val):
	var new_text = str(val)
	label.text = new_text
