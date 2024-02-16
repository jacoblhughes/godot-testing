extends RigidBody2D


@onready var game = get_parent()
var sprite : Sprite2D
#var basic_ball_scene = preload("res://generic/ball.tscn")
signal wall_collision_and_split(current_position,current_velocity,split_number)
var random_color
var music_notes 
var note = 0
var texture
@export var start_with_linear_velocity = false
@export var starting_linear_velocity_direction : Vector2
@export var starting_linear_velocity_value : int
@export var hit_wall_apply_color_to_wall = false
@export var hit_wall_change_ball_color = false
@export var hit_wall_grow_ball = false
@export var grow_ball_value = 1.1
@export var hit_wall_speed_up = false
@export var speed_up_value = 1.1
@export var hit_wall_split = false
@export var split_value = 2

func _ready():

	if has_node("Sprite2D"):
		sprite = $Sprite2D
		random_color = Color(randf(), randf(), randf(), 1.0)
		texture = sprite.texture
		sprite.modulate = random_color

	if start_with_linear_velocity:
		start_linear_velocity()
		
		
func _process(_delta):
	pass

func start_linear_velocity():
	linear_velocity = starting_linear_velocity_direction * starting_linear_velocity_value

func _on_body_entered(body):

	if body is Wall:
		wall_collision_and_split.emit(global_position,linear_velocity,split_value)
		if hit_wall_apply_color_to_wall:
			body.get_node("ColorRect").color = random_color
		if hit_wall_change_ball_color:
			random_color = Color(randf(), randf(), randf(), 1.0)
			sprite.modulate = random_color
		if hit_wall_grow_ball:
			%Sprite2D.scale *= grow_ball_value
			%CollisionShape2D.scale *= grow_ball_value
		if hit_wall_speed_up:
			linear_velocity *= speed_up_value
		if hit_wall_split:
			pass
			
	else:
		print('okay but')
	pass

