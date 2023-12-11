extends Node2D

@export var platform_choice = 0

@onready var animation_player = $AnimationPlayer
@onready var sprite = $AnimatableBody2D/Sprite2D
@export var platform_scale : Vector2 = Vector2(1,1)
# Get the current position of the animation in seconds


# Advance the animation by one second

# Called when the node enters the scene tree for the first time.
func _ready():
	scale = platform_scale
#	animation_player.get_animation("choice").seek(2)
#	var current_position = animation_player.get_position()	
	sprite.frame = platform_choice
	if platform_choice == 1:
		animation_player.set_current_animation("move_horizontal")
		animation_player.play()
	if platform_choice == 2:
		animation_player.set_current_animation("move_vertical")
		animation_player.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass

