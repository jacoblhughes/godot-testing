extends Area2D

@export var flowers: AnimatedSprite2D

var type = 0
var direction = Vector2i.ZERO
var next_position = Vector2.ZERO
var coords: Vector2i = Vector2i.ZERO
var next_coords: Vector2i = Vector2i.ZERO
var player: CharacterBody2D

var should_grow = true
var rng: RandomNumberGenerator

# Called when the node enters the scene tree for the first time.
func _ready():
	flowers.animation_finished.connect(_on_flowers_animation_finished)
	var seed = int(hash(get_instance_id()) + Time.get_unix_time_from_system())
	rng = RandomNumberGenerator.new()
	rng.seed = seed


func check_for_growth():
	var tile_data = get_parent().get_cell_tile_data(0, coords, false)
	var base_type = tile_data.get_custom_data("base_type")

	if base_type == "ground":
		if not flowers.is_playing() and should_grow:
			var growth_names = flowers.sprite_frames.get_animation_names()
			var choice = growth_names[rng.randi() % growth_names.size()]
			flowers.visible = true
			flowers.play(choice)

	else:
		flowers.visible = false
		should_grow = true
		flowers.stop()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	check_for_growth()
	pass

func _on_flowers_animation_finished():
	flowers.frame = flowers.sprite_frames.get_frame_count(flowers.animation) - 1
	should_grow = false

func set_coords(val):
	coords = val
