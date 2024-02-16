extends Node2D

var wall_elements
var ball_elements
var grav_elements

# Called when the node enters the scene tree for the first time.
func _ready():
	wall_elements = get_tree().get_nodes_in_group("wall")

	ball_elements = get_tree().get_nodes_in_group("ball")
	for element in ball_elements:

		pass
	grav_elements = get_tree().get_nodes_in_group("gravity")
	pass


