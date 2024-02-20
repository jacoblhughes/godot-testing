extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	%Player.get_node("AnimationPlayer").play("collision_village")
	NavigationManager.on_level_spawn()
	pass # Replace with function body.
