extends CanvasLayer

signal relaunch
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func reset_show():
	show()
	
func reset_hide():
	hide()

func _on_button_button_down():
	relaunch.emit()
	pass
