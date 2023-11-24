extends RigidBody2D

var color_rect
var trail = []
var my_timer : Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	color_rect = $ColorRect

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Add the current position and color to the trail
	trail.append({"pos": position, "color": Color.AQUA})
	await 
	print(trail)
	# Limit the trail length to a certain number of points

# Called every frame for drawing.
func _draw():
	# Draw the trail
	for point in trail:
		draw_rect(Rect2(point["pos"] - Vector2(color_rect.size.x / 2, color_rect.size.y / 2), color_rect.size), point["color"])


func _on_body_entered(body):
	print('here')
	linear_velocity *= 1.1
	
	pass # Replace with function body.
