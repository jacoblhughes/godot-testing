extends Area2D

@export var flowers : Sprite2D

var type = 0
var direction = Vector2i.ZERO
var next_position = Vector2.ZERO
var coords : Vector2i = Vector2i.ZERO
var next_coords : Vector2i = Vector2i.ZERO
var player : CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	check_for_growth()
	pass

func check_for_growth():
	var tile_data = get_parent().get_cell_tile_data(0,coords,false)
	var base_type = tile_data.get_custom_data("base_type")
	if base_type == "ground":
		flowers.visible = true
	else:
		flowers.visible = false

func set_coords(val):
	coords = val
