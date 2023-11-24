extends RigidBody2D

var color_rect
@onready var game = get_parent().get_node("Game")
var timer_node : Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	
	color_rect = $ColorRect

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	# Add the current position and color to the trail


func _on_level_timer_timeout():

	game.trail.append({"pos": position, "color": Color.AQUA})
	queue_redraw()

	# Limit the trail length to a certain number of points

# Called every frame for drawing.
func _draw():
	print(.trail)
	for point in game.trail:
		print(point)
		draw_rect(Rect2(point["pos"], color_rect.size), point["color"])


func _on_body_entered(body):

	linear_velocity *= 1.1
	
	pass # Replace with function body.
