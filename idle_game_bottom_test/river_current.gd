extends Area2D

var type = 0
var direction = Vector2i.ZERO
var next_position = Vector2.ZERO
var coords : Vector2i = Vector2i.ZERO
var next_coords : Vector2i = Vector2i.ZERO
var player : CharacterBody2D

func _ready():
	input_event.connect(_on_input_event)
	next_coords = get_parent().local_to_map(global_position)
	next_position = get_parent().map_to_local(next_coords)
	pass

func _process(delta):
	if overlaps_body(player):
		player.next_position = next_position

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseMotion:
		if event.button_mask == 2:
			type = 10

		elif event.pressure > 0.1 and event.button_mask == 1:
			match event.relative:
				Vector2(0,0):
					type = 1
					get_parent().set_cell(0, coords, 0, Vector2i(1,1))
				Vector2(-1,0):
					type = 2
					get_parent().set_cell(0, coords, 0, Vector2i(0,1))
				Vector2(-1,1):
					type = 3
					get_parent().set_cell(0, coords, 0, Vector2i(0,2))
				Vector2(0,1):
					type = 4
					get_parent().set_cell(0, coords, 0, Vector2i(1,2))
				Vector2(1,1):
					type = 5
					get_parent().set_cell(0, coords, 0, Vector2i(2,2))
				Vector2(1,0):
					type = 6
					get_parent().set_cell(0, coords, 0, Vector2i(2,1))
				Vector2(1,-1):
					type = 7
					get_parent().set_cell(0, coords, 0, Vector2i(2,0))
				Vector2(0,-1):
					type = 8
					get_parent().set_cell(0, coords, 0, Vector2i(1,0))
				Vector2(-1,-1):
					type = 9
					get_parent().set_cell(0, coords, 0, Vector2i(0,0))

	elif event is InputEventMouseButton and event.pressed and event.button_index == 1:
		type = (type % 9) + 1

	update_direction_and_cell()

func set_coords(val):
	coords = val

func update_direction_and_cell():
	match type:
		1:
			direction = Vector2i(0,0)
			get_parent().set_cell(0, coords, 0, Vector2i(1,1))
		2:
			direction = Vector2i(-1,0)
			get_parent().set_cell(0, coords, 0, Vector2i(0,1))
		3:
			direction = Vector2i(-1,1)
			get_parent().set_cell(0, coords, 0, Vector2i(0,2))
		4:
			direction = Vector2i(0,1)
			get_parent().set_cell(0, coords, 0, Vector2i(1,2))
		5:
			direction = Vector2i(1,1)
			get_parent().set_cell(0, coords, 0, Vector2i(2,2))
		6:
			direction = Vector2i(1,0)
			get_parent().set_cell(0, coords, 0, Vector2i(2,1))
		7:
			direction = Vector2i(1,-1)
			get_parent().set_cell(0, coords, 0, Vector2i(2,0))
		8:
			direction = Vector2i(0,-1)
			get_parent().set_cell(0, coords, 0, Vector2i(1,0))
		9:
			direction = Vector2i(-1,-1)
			get_parent().set_cell(0, coords, 0, Vector2i(0,0))
		10:
			direction = Vector2i(0,0)
			get_parent().set_cell(0, coords, 0, Vector2i(3,0))
	next_coords = get_parent().local_to_map(global_position) + direction
	next_position = get_parent().map_to_local(next_coords)
