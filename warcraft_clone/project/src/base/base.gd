extends Node2D

@export var sprite : Sprite2D
@export var marker_1 : Marker2D
@export var marker_2 : Marker2D
@export var unit_1 : PackedScene
@export var unit_2 : PackedScene
@export var timer : Timer

var cell_size = 16  # Size of each grid cell
var grid_width = 10  # Number of cells in the width (adjust as needed)
var grid_height = 6  # Number of cells in the height (adjust as needed)

var spawn_position : Vector2
var current_row : int = 0  # Row index to track where we are
var current_col : int = 0  # Column index to track where we are
var inty : int

func _enter_tree():
	set_multiplayer_authority(get_parent().name.to_int(),true)

func _ready():
	timer.timeout.connect(_on_timer_timeout)
	spawn_position = marker_1.global_position
	start_timer()
	pass

func _process(delta):
	pass

func start_timer():
	timer.start()

func _on_timer_timeout():
	# Calculate the spawn position based on the current row and column
	spawn_position = Vector2(current_col * cell_size, (grid_height - 1 - current_row) * cell_size)

	# Instantiate the unit and place it at the calculated position
	var unit = unit_1.instantiate()
	unit.global_position = spawn_position + self.global_position
	unit.direction = Vector2(1, 1)  # Example direction (adjust as needed)
	unit.team = get_parent().name.to_int()
	get_parent().call_deferred("add_child", unit, true)

	# Move to the next position in the grid
	current_col += 1

	# If we reach the end of the row, move to the next row and reset column
	if current_col >= grid_width:
		current_col = 0
		current_row += 1

	# Stop spawning if we exceed the grid's height
	if current_row >= grid_height:
		timer.stop()  # Stop the timer when the grid is full
