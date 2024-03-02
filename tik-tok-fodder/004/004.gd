extends Node2D
var i=0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_goal_area_entered(area):
	if area is BowlingPinArea004:
		i+=1
		area._goal_score()
		if i==3:
			if !%Background.is_playing():
				%Background.play("default")
	pass # Replace with function body.


func _on_goal_body_entered(body):
	print(body)
	if body is BowlingBall004:
		body.queue_free()
	pass # Replace with function body.
