extends Area2D

var type = 0
var input_diection = Vector2i.ZERO
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
	if GameManager.get_game_enabled():
		if event is InputEventMouseMotion and not Input.is_action_pressed("shift"):
			if event.button_mask == 2:
				type = 10

			elif event.pressure > 0.1 and event.button_mask == 1:
				var angle = event.relative.angle()
				input_diection = get_direction_from_angle(angle)
				update_type_and_cell()
			update_direction_and_cell()

		elif event is InputEventMouseButton and event.pressed and event.button_index == 1 and not Input.is_action_pressed("shift"):
			type = (type % 12) + 1
			update_direction_and_cell()

		elif event is InputEventMouseButton and event.pressed and event.button_index == 1 and Input.is_action_pressed("shift"):

			get_parent().set_cell(3,coords,3,Vector2i(0, 0),1)

#set_cell(layer: int, coords: Vector2i, source_id: int = -1, atlas_coords: Vector2i = Vector2i(-1, -1), alternative_tile: int = 0)
func get_direction_from_angle(angle):
		if abs(angle) < PI / 8:
			return Vector2i(1, 0)   # Right
		elif abs(angle - PI/4) < PI / 8:
			return Vector2i(1, 1)   # Down-Right
		elif abs(angle - PI/2) < PI / 8:
			return Vector2i(0, 1)   # Down
		elif abs(angle - 3*PI/4) < PI / 8:
			return Vector2i(-1, 1)  # Down-Left
		elif abs(abs(angle) - PI) < PI / 8:
			return Vector2i(-1, 0)  # Left
		elif abs(angle + 3*PI/4) < PI / 8:
			return Vector2i(-1, -1) # Up-Left
		elif abs(angle + PI/2) < PI / 8:
			return Vector2i(0, -1)  # Up
		elif abs(angle + PI/4) < PI / 8:
			return Vector2i(1, -1)  # Up-Right


func update_type_and_cell():
	match input_diection:
		Vector2i(0, 0):
			type = 1
		Vector2i(-1, 0):
			type = 2
		Vector2i(-1, 1):
			type = 3
		Vector2i(0, 1):
			type = 4
		Vector2i(1, 1):
			type = 5
		Vector2i(1, 0):
			type = 6
		Vector2i(1, -1):
			type = 7
		Vector2i(0, -1):
			type = 8
		Vector2i(-1, -1):
			type = 9
		_:
			type = 0  # Default type if none matched

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
		11:
			direction = Vector2i(0,0)
			get_parent().set_cell(0, coords, 0, Vector2i(0,3))

	next_coords = get_parent().local_to_map(global_position) + direction
	next_position = get_parent().map_to_local(next_coords)
