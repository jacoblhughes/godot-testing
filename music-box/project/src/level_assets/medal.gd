extends Node2D

signal medal_obtained
@export var level : int = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	body.unlock_power(level)
	queue_free()
	pass # Replace with function body.
