extends Node2D

@export var nodes_to_move_x : Array[Node]
@export var nodes_to_scale_x : Array[Node]
@export var nodes_to_move_y : Array[Node]
@export var nodes_to_scale_y : Array[Node]

@export var start_position : Marker2D
@export var end_position : Marker2D

@export var tile_map : TileMap



var xform = 0
var yform = 0
var xatio = 0
var yatio = 0

var clicks = 0

signal nodes_moved

var start = Vector2i.ZERO
var end = Vector2i.ZERO
var cell_size = Vector2i.ZERO

var astar_grid = AStarGrid2D.new()
var grid_size



# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().window_resized.connect(_on_window_resized)
	start = Vector2i(start_position.position)
	end = Vector2i(end_position.position)
	cell_size = tile_map.get_tileset().tile_size
	GameManager.set_cell_size(cell_size)

func _draw():
	draw_rect(Rect2(start - (cell_size/2), cell_size), Color.GHOST_WHITE)
	draw_rect(Rect2(end - (cell_size/2), cell_size), Color.RED)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	%Clicks.text = str(clicks)
	pass

func _on_window_resized():


	xform = float(DisplayServer.window_get_size().x)
	yform = float(DisplayServer.window_get_size().y)

	xatio = xform/1920.00
	yatio = yform/216.00
	print(xform , " " , yform)

	if xform > 1920.00:
		for node in nodes_to_move_x:
			print(node.position)
			node.position.x *= xatio
			print(node.position)
		for node in nodes_to_scale_x:
			node.scale.x *= xatio

	if yform > 216.00:
		for node in nodes_to_move_y:
			node.position.y *= yatio
		for node in nodes_to_scale_y:
			node.scale.y *= yatio

	nodes_moved.emit()


func add_clicks(val):

	var new_clicks = clicks + val
	clicks = new_clicks
