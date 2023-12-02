extends Node2D

@onready var spawn_pos = $SpawnPosition

# Called when the node enters the scene tree for the first time.
func get_spawn_position():
	return spawn_pos.global_position
