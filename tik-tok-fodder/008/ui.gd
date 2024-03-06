extends CanvasLayer


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

func return_coins():
	return int(%Distance.text)

func update_coins(value):
	var old_value = return_coins()
	var new_value = old_value + value
	%Coins.text = str(new_value)
