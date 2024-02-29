extends StaticBody2D

@export var animation_index: int: set = set_animation_index
@export var current_animation: String: set =  set_current_animation

func _ready():
	set_animation_index(animation_index)
	pass

func play_animation_from_value():
	var animated_sprite = %AnimatedSprite2D
	print('here')
	if animated_sprite:
		animated_sprite.play(animated_sprite.sprite_frames.get_animation_names()[animation_index])

func set_animation_index(value: int):
	animation_index = value
	var animated_sprite = %AnimatedSprite2D
	if animated_sprite:
		animated_sprite.animation = animated_sprite.sprite_frames.get_animation_names()[animation_index]


func set_current_animation(value: String):
	current_animation = value
	var animation_player = %AnimationPlayer
	if animation_player.has_animation(current_animation):
		animation_player.play(current_animation)
	else:
		print("Animation not found:", current_animation)

