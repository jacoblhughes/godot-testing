extends Node2D

var wall_elements
var ball_elements
var grav_elements
var basic_ball_scene = preload("res://generic/ball_basic.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	wall_elements = get_tree().get_nodes_in_group("wall")

	ball_elements = get_tree().get_nodes_in_group("ball")
	for element in ball_elements:
		element.wall_collision_and_split.connect(_on_wall_collision_and_split)
		pass
	grav_elements = get_tree().get_nodes_in_group("gravity")
	pass

func _on_wall_collision_and_split(this_position, this_velocity, split_number):
	var angle_change = 180.0 / split_number
	var current_angle = this_velocity.angle()
	print(split_number)
	print(this_velocity.normalized())
	if split_number>0:
		for i in range(1, split_number+1):
			var basic_ball_instance = basic_ball_scene.instantiate()
			basic_ball_instance.position = this_position

			var new_angle = current_angle + deg_to_rad(angle_change * i)
			var new_velocity = Vector2(this_velocity.length(), 0).rotated(new_angle)
			basic_ball_instance.linear_velocity = new_velocity

			add_child.call_deferred(basic_ball_instance,true)
