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
@export var starting_linear_velocity_direction = Vector2(0,0)
@export var starting_linear_velocity_value = 100

func _ready():
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
		
		random_color = Color(randf(), randf(), randf(), 1.0)
		body.get_node("ColorRect").color = random_color
		if body is Wall:
			body.get_node("AudioStreamPlayer").play()
			sprite.modulate = random_color
	#		linear_velocity *= 1.05
	#		wall_collision.emit(position,linear_velocity)
	else:
		print('okay but')
	pass
