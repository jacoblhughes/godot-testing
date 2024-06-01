extends Sprite2D

var type = 0
var direction = Vector2i.ZERO
var next_position = Vector2.ZERO
var coords: Vector2i = Vector2i.ZERO
var next_coords: Vector2i = Vector2i.ZERO
var player: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func set_coords(val):
	coords = val
