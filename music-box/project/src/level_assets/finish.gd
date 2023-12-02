extends Node2D

#@onready var animated_sprite = $AnimatedSprite2D
signal player_finish

## Called when the node enters the scene tree for the first time.
#func animate():
#	animated_sprite.play('default')


func _on_area_2d_body_entered(body):
	print('here')
	if body is Player:
		player_finish.emit(body)
	pass # Replace with function body.
