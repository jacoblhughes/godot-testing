extends Node2D

signal checkpoint_touched
@onready var animated_sprite = $Area2D/AnimatedSprite2D
@onready var checkpoint_pos = $Area2D/StaticBody2D/CheckpointPosition
var checked = false
# Called when the node enters the scene tree for the first time.
func animate():
	animated_sprite.play('check')


func _on_area_2d_body_entered(body):
	if body is Player:
		if !checked:

			animate()
			checked = true
		checkpoint_touched.emit(get_checkpoint_position())
	pass # Replace with function body.

func get_checkpoint_position():
	return checkpoint_pos.global_position
