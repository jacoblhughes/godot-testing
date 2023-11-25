extends RigidBody2D


@onready var game = get_parent()
@export var color_rect : ColorRect
var timer_node
signal wall_collision(collision_info)
var random_color
var music_notes 
var note = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	timer_node = get_parent().get_node("Timer")
	timer_node.timeout.connect(_on_timer_timeout)
	color_rect = $ColorRect
	game.set_color_rect_size(color_rect.size)
	music_notes = get_parent().get_node("Music").get_children()
	random_color = Color(randf(), randf(), randf(), 1.0)
	game.add_position_info(position,random_color)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	# Add the current position and color to the trail

func _on_timer_timeout():
	print(position,random_color)
	game.add_position_info(position,random_color)
	pass


	# Limit the trail length to a certain number of points

# Called every frame for drawing.



func _on_body_entered(body):
	random_color = Color(randf(), randf(), randf(), 1.0)
	color_rect.color = random_color
#	music_notes[note].play()
#	print(body)
	body.get_node("ColorRect").color = random_color
#	note+=1
#	if (note == 4):
#		note = 0
	linear_velocity *= 1.05
	
	pass # Replace with function body.
