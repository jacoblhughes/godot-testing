extends Node2D

var wall_elements
var ball_elements
var grav_elements
var ball_instance_scene = preload("res://generic/ball.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	wall_elements = get_tree().get_nodes_in_group("wall")

	ball_elements = get_tree().get_nodes_in_group("ball")
	for element in ball_elements:
		element.wall_collision_and_split.connect(_on_wall_collision_and_split)
		pass
	grav_elements = get_tree().get_nodes_in_group("gravity")
	pass


func _on_wall_collision_and_split(pos,vel,split_value):
	print(rad_to_deg(vel.angle()))
	var ball_instance = ball_instance_scene.instantiate()
	ball_instance.position = pos
	ball_instance.linear_velocity = -vel
	ball_instance.wall_collision_and_split.connect(_on_wall_collision_and_split)
#	if not shooting_ball_instance.has_method("_on_wall_collision"):
#		shooting_ball_instance.wall_collision.connect(_on_wall_collision)
	ball_instance.hit_wall_split = true

	add_child.call_deferred(ball_instance,true)

