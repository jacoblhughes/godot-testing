extends Node2D

@export var destination_level_tag : String
# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body is Player:
		NavigationManager.go_to_level(destination_level_tag)
		pass
	pass # Replace with function body.
