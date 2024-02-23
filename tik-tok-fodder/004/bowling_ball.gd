extends RigidBody2D
class_name BowlingBall004

# Called when the node enters the scene tree for the first time.
func _ready():
	apply_impulse(Vector2(0,-150),Vector2(0,0))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	print("ball: ",body)
	if body is BowlingPin004:

		var impact_direction = (body.global_position - global_position).normalized()
		body.apply_impulse(impact_direction * 150, impact_direction)
