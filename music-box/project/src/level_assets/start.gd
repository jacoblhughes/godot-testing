extends StaticBody2D

@onready var spawn_pos = $SpawnPosition

# Called when the node enters the scene tree for the first time.
func get_spawn_position():
	return spawn_pos.global_position


func _on_body_entered(body):
	print(body)
	pass # Replace with function body.
