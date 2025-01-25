extends Node2D

var dragging = false  # are we currently dragging?
var selected = []  # array of selected units
var drag_start = Vector2.ZERO  # location where the drag begian
var select_rect = RectangleShape2D.new()
var placing_base = false
@export var UI : CanvasLayer
@export var base_sprite_scene: PackedScene  # Default base texture
var base_sprite : Sprite2D
@export var base_scene : PackedScene
var base : Node2D
var cell_size = 16

var cols = 1152/cell_size  # 1152 / 64 = 18
var rows = 648/cell_size  # 648 / 64 = 10

func _ready():
	UI.base_being_placed.connect(_on_placing_base)
	queue_redraw()  # Trigger the drawing of the grid

func _process(delta):
	if placing_base:
		base_sprite.global_position = get_global_mouse_position()

func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and placing_base:
		if event.pressed:
			# Get the mouse position
			var mouse_pos = get_global_mouse_position()
			var base = base_scene.instantiate()
			# Snap the position to the nearest grid intersection
			var snapped_x = round(mouse_pos.x / cell_size) * cell_size
			var snapped_y = round(mouse_pos.y / cell_size) * cell_size
			var snapped_position = Vector2(snapped_x, snapped_y)

			# Place the base sprite at the snapped position
			base.global_position = snapped_position
			base_sprite.queue_free()
			# Finalize placement: Add base sprite to the scene
			get_parent().add_child(base)

			# Disable placement mode
			placing_base = false
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if selected.size() == 0:
				dragging = true
				drag_start = get_global_mouse_position()  # Use global mouse position
			else:
				for item in selected:
					item.collider.target = get_global_mouse_position()  # Use global mouse position
					item.collider.selected = false
				selected = []
		elif dragging:
			dragging = false
			queue_redraw()
			var drag_end = get_global_mouse_position()  # Use global mouse position
			select_rect.extents = abs(drag_end - drag_start) / 2
			var space = get_world_2d().direct_space_state
			var q = PhysicsShapeQueryParameters2D.new()
			q.shape = select_rect
			q.collision_mask = 2
			q.transform = Transform2D(0, (drag_end + drag_start) / 2)
			selected = space.intersect_shape(q)
			for item in selected:
				item.collider.selected = true
	if event is InputEventMouseMotion and dragging:
		queue_redraw()

func _draw():
	if dragging:
		print(drag_start,"==" ,get_global_mouse_position())
		draw_rect(Rect2(drag_start, get_global_mouse_position()-drag_start),
				Color.YELLOW, true)
	 # Calculate the starting position of the grid, so 0,0 is in the center
	var start_x = 0
	var start_y = 0

	# Draw vertical lines
	for i in range(cols + 1):  # +1 to include the rightmost line
		var x = start_x + i * cell_size
		draw_line(Vector2(x, start_y), Vector2(x, start_y + rows * cell_size), Color(1, 1, 1), 1)  # Vertical lines

	# Draw horizontal lines
	for j in range(rows + 1):  # +1 to include the bottommost line
		var y = start_y + j * cell_size
		draw_line(Vector2(start_x, y), Vector2(start_x + cols * cell_size, y), Color(1, 1, 1), 1)  # Horizontal lines

# Grid cell size
func _on_placing_base():
	placing_base = true
	base_sprite = base_sprite_scene.instantiate()
	add_child(base_sprite)
