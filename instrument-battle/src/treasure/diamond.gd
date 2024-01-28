extends Area2D
class_name Treasure

var value = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	GameManager.add_score(value)
	pass # Replace with function body.
