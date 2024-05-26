extends Node2D

@export var nodes_to_move_x : Array[Node]
@export var nodes_to_scale_x : Array[Node]
@export var nodes_to_move_y : Array[Node]
@export var nodes_to_scale_y : Array[Node]

var xform = 0
var yform = 0
var xatio = 0
var yatio = 0

signal nodes_moved

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().window_resized.connect(_on_window_resized)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_window_resized():
	
	var xform = float(DisplayServer.window_get_size().x)
	var yform = float(DisplayServer.window_get_size().y)

	var xatio = xform/1920.00
	var yatio = yform/200.00
	print(xform , " " , yform)

	if xform > 1920.00:
		for node in nodes_to_move_x:
			print(node.position)
			node.position.x *= xatio
			print(node.position)
		for node in nodes_to_scale_x:
			node.scale.x *= xatio

	if yform > 200.00:
		for node in nodes_to_move_y:
			node.position.y *= yatio
		for node in nodes_to_scale_y:
			node.scale.y *= yatio

	nodes_moved.emit()
