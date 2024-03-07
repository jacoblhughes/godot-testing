extends CanvasLayer
signal upgrade_pressed
# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func update_score(value):
	%Score.text = str(value)

func update_distance(value):
	%Distance.text = str(value)
	
func update_coins(value):
	%Coins.text = str(value)


func _on_upgrade_button_pressed():
	upgrade_pressed.emit()
	pass # Replace with function body.
