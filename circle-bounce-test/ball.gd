extends RigidBody2D

var color_rect
@onready var game = get_parent().get_node("Game")



# Called when the node enters the scene tree for the first time.
func _ready():
	
	color_rect = $ColorRect
	game.set_color_rect_size(color_rect.size)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	# Add the current position and color to the trail




	# Limit the trail length to a certain number of points

# Called every frame for drawing.

