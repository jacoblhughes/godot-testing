extends Node2D

signal player_entered(body)
signal player_exited(body)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	print('here',body)
	player_entered.emit(body)
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	player_exited.emit(body)
	pass # Replace with function body.
