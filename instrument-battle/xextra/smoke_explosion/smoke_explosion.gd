extends Node2D


func _ready():

	%AnimatedSprite2D.play("explosion")
	await %AnimatedSprite2D.animation_finished
	queue_free()
