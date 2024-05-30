extends Area2D

@export var flowers : AnimatedSprite2D

var type = 0
var direction = Vector2i.ZERO
var next_position = Vector2.ZERO
var coords : Vector2i = Vector2i.ZERO
var next_coords : Vector2i = Vector2i.ZERO
var player : CharacterBody2D

var should_grow = true

# Called when the node enters the scene tree for the first time.
func _ready():
	flowers.animation_finished.connect(_on_flowers_animation_finished)
	randi() # Call randi to ensure the seed is set

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	check_for_growth()
	pass

func check_for_growth():
	var tile_data = get_parent().get_cell_tile_data(0, coords, false)
	var base_type = tile_data.get_custom_data("base_type")
	if base_type == "ground":
		var growth_names = flowers.sprite_frames.get_animation_names()
		var choice = growth_names[randi() % flowers.sprite_frames.get_animation_names().size()]
		if not flowers.is_playing() and should_grow:
			flowers.visible = true

			if flowers.animation != choice:
				flowers.play(choice)
	else:
		flowers.visible = false
		should_grow = true
		flowers.stop()

func _on_flowers_animation_finished():
	flowers.frame = flowers.sprite_frames.get_frame_count(flowers.animation) - 1
	should_grow = false
	
func set_coords(val):
	coords = val
