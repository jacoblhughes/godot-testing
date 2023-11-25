extends Node2D

@export var trail = []
var my_size : Vector2
var timer_node : Timer
var balls
#var color_rect
var random_color
var music_notes

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

func set_color_rect_size(node_size):
	my_size = Vector2(16,16)

func _draw():
	for point in trail:
		draw_rect(Rect2(point["pos"] - Vector2(my_size.x/2,my_size.y/2),my_size), point["color"])

func add_position_info(ball_position,ball_color):
	trail.append({"pos": ball_position, "color": ball_color})

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(trail.size() >1):
		queue_redraw()
	pass


func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().reload_current_scene()
