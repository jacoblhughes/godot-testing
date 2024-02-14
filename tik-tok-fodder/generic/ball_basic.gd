extends RigidBody2D


@onready var game = get_parent()
var sprite : Sprite2D

signal wall_collision(current_position,current_velocity)
var random_color
var music_notes 
var note = 0
var texture
var sprite_scale
@export var start_with_linear_velocity = false
@export var starting_linear_velocity_direction : Vector2
@export var starting_linear_velocity_value : int
@export var hit_wall_change_color_of_wall = false

func _ready():
	print(start_with_linear_velocity)
	if has_node("Sprite2D"):
		sprite = $Sprite2D
		random_color = Color(randf(), randf(), randf(), 1.0)
		texture = sprite.texture
		sprite.modulate = random_color
		sprite_scale = sprite.scale
	if start_with_linear_velocity:
		start_linear_velocity()
		
		
func _process(_delta):
	pass

func start_linear_velocity():
	linear_velocity = starting_linear_velocity_direction * starting_linear_velocity_value

func _on_body_entered(body):
	if body is Wall:
		if hit_wall_change_color_of_wall:
			body.get_node("ColorRect").color = random_color
			random_color = Color(randf(), randf(), randf(), 1.0)
			sprite.modulate = random_color
	else:
		print('okay but')
	pass
