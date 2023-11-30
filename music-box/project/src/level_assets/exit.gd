extends Area2D

@onready var animated_sprite = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func animate():
	animated_sprite.play('default')
