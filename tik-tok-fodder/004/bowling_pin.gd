extends RigidBody2D
class_name BowlingPin004

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body is BowlingPin004:
		print("pin: ",body)
		var impact_direction = (body.global_position - global_position).normalized()
		body.apply_impulse(impact_direction * 50, impact_direction)
	pass # Replace with function body.


func _on_area_2d_goaled():
	print("goaled")
	self.queue_free()
	pass # Replace with function body.
