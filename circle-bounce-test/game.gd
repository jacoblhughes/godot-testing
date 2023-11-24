extends Node2D

@export var trail = []
var my_size : Vector2
var timer_node : Timer
var ball
var color_rect
var random_color
var music_notes
var note
# Called when the node enters the scene tree for the first time.
func _ready():
	ball = get_parent().get_node("Ball")
	color_rect = ball.get_node("ColorRect")
	timer_node = Timer.new()
	timer_node.name = "Level Timer"
	timer_node.wait_time = .25
	timer_node.timeout.connect(_on_level_timer_timeout)
	add_child(timer_node)
	timer_node.start()
	random_color = Color(randf(), randf(), randf(), 1.0)
	color_rect.color = random_color
	trail.append({"pos": ball.position, "color": color_rect.color})
	music_notes = get_parent().get_node("Music").get_children()
	note = 0
	pass # Replace with function body.

func set_color_rect_size(node_size):
	my_size = node_size

func _draw():
	for point in trail:
		draw_rect(Rect2(point["pos"] - Vector2(my_size.x/2,my_size.y/2),my_size), point["color"])



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(trail.size() >1):
		queue_redraw()
	pass
	
func _on_level_timer_timeout():


	trail.append({"pos": ball.position, "color": random_color})



func _on_ball_body_entered(body):
	random_color = Color(randf(), randf(), randf(), 1.0)
	color_rect.color = random_color
	body.get_node("ColorRect").color = random_color
	ball.linear_velocity *= 1.05
	print(note)
	music_notes[note].play()
	note+=1
	if (note == 4):
		note = 0
	pass # Replace with function body.

func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().reload_current_scene()
