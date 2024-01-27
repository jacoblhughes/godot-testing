extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	%Smoke.material.set_shader_parameter("texture_offset", Vector2(randfn(0.0, 1.0), randfn(0.0, 1.0)))
	%AnimationPlayer.play("explosion")
	await %AnimationPlayer.animation_finished
	queue_free()
