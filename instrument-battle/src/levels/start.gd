extends Node2D

signal start
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body is Player:
		start.emit()
		$AnimatedSprite2D.play()
		await get_tree().create_timer(5).timeout
		$AnimatedSprite2D.stop()
	pass # Replace with function body.
