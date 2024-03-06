extends Area2D
class_name Coin008
signal coin_touched
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body is Ball008:
		coin_touched.emit()
		queue_free()
	pass # Replace with function body.
