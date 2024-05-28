extends Area2D

@export var type = 0
var direction = Vector2i.ZERO
var next_position = Vector2.ZERO
var coords : Vector2i = Vector2i.ZERO
var next_coords : Vector2i = Vector2i.ZERO
var player : CharacterBody2D
# Called when the node enters the scene tree for the first time.
func _ready():
	input_event.connect(_on_input_event)
	body_entered.connect(_on_body_entered)
	next_coords = get_parent().local_to_map(global_position) + Vector2i(0,0)
	next_position = get_parent().map_to_local(next_coords)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if overlaps_body(player):

		player.next_position = next_position

	pass


func _on_input_event(viewport, event, shape_idx):
	print(event)
	if event is InputEventMouseMotion and event.button_mask == 2:
		direction = Vector2i(0,0)
		get_parent().set_cell(0,coords,0,Vector2i(3,0))

	if event is InputEventMouseMotion and event.pressure > 0.1 and event.button_mask == 1:
		if event.relative == Vector2(0,0):
			type = 1
			get_parent().set_cell(0,coords,0,Vector2i(1,1))
		if event.relative == Vector2(-1,0):
			type = 2
			get_parent().set_cell(0,coords,0,Vector2i(0,1))
		if event.relative == Vector2(-1,1):
			type = 3
			get_parent().set_cell(0,coords,0,Vector2i(0,2))
		if event.relative == Vector2(0,1):
			type = 4
			get_parent().set_cell(0,coords,0,Vector2i(1,2))
		if event.relative == Vector2(1,1):
			type = 5
			get_parent().set_cell(0,coords,0,Vector2i(2,2))
		if event.relative == Vector2(1,0):
			type = 6
			get_parent().set_cell(0,coords,0,Vector2i(2,1))
		if event.relative == Vector2(1,-1):
			type = 7
			get_parent().set_cell(0,coords,0,Vector2i(2,0))
		if event.relative == Vector2(0,-1):
			type = 8
			get_parent().set_cell(0,coords,0,Vector2i(1,0))
		if event.relative == Vector2(-1,-1):
			type = 9
			get_parent().set_cell(0,coords,0,Vector2i(0,0))

	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		print('ehererer')
		if type >= 10:
			type = 1
		else:
			type += 1

	if type == 1:
		direction = Vector2i(0,0)
		get_parent().set_cell(0,coords,0,Vector2i(1,1))
	if type == 2:
		direction = Vector2i(-1,0)
		get_parent().set_cell(0,coords,0,Vector2i(0,1))
	if type == 3:
		direction = Vector2i(-1,1)
		get_parent().set_cell(0,coords,0,Vector2i(0,2))
	if type == 4:
		direction = Vector2i(0,1)
		get_parent().set_cell(0,coords,0,Vector2i(1,2))
	if type == 5:
		direction = Vector2i(1,1)
		get_parent().set_cell(0,coords,0,Vector2i(2,2))
	if type == 6:
		direction = Vector2i(1,0)
		get_parent().set_cell(0,coords,0,Vector2i(2,1))
	if type == 7:
		direction = Vector2i(1,-1)
		get_parent().set_cell(0,coords,0,Vector2i(2,0))
	if type == 8:
		direction = Vector2i(0,-1)
		get_parent().set_cell(0,coords,0,Vector2i(1,0))
	if type == 9:
		direction = Vector2i(-1,-1)
		get_parent().set_cell(0,coords,0,Vector2i(0,0))

	next_coords = get_parent().local_to_map(global_position) + direction
	next_position = get_parent().map_to_local(next_coords)




func _on_body_entered(body):
	if body is CharacterBody2D:

		pass # Replace with function body.

func set_coords(val):
	coords = val
	pass
