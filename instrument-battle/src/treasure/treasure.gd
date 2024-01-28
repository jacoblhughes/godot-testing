extends Area2D
class_name Treasure

signal collected

@export var value = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if body is Player:
		GameManager.add_score(value)
		collected.emit(self)
	pass

