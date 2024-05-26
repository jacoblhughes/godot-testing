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
	print("start")
	pass # Replace with function body.

func initialize_grid():
	grid_size = Vector2i(get_viewport_rect().size)

	astar_grid.size = grid_size
	astar_grid.cell_size = cell_size
	astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	astar_grid.offset = cell_size/2
	astar_grid.update()

	update_path()

func _draw():
	print('hererrr')
	draw_rect(Rect2(start - (cell_size/2), cell_size), Color.GHOST_WHITE)
	print(start,"  ",cell_size)
	draw_rect(Rect2(end - (cell_size/2), cell_size), Color.RED)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	%Clicks.text = str(clicks)
	pass

func _on_window_resized():


	var xform = float(DisplayServer.window_get_size().x)
	var yform = float(DisplayServer.window_get_size().y)

	var xatio = xform/1920.00
	var yatio = yform/216.00
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
	print('node moved')
	initialize_grid()


func add_clicks(val):

	var new_clicks = clicks + val
	clicks = new_clicks

func update_path():
	print("start: ",start)
	$Line2D.points = PackedVector2Array(astar_grid.get_point_path(start/cell_size, end/cell_size))
