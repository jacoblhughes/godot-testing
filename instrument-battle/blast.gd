extends Area2D

signal hit_ghost_enemy

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body is GhostEnemy:
		hit_ghost_enemy.emit()
		body.hit()
	pass # Replace with function body.
