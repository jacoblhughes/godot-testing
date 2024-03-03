extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body is Starter002:
		$AnimatedSprite2D.play("default")
		for overlap in  %Blow.get_overlapping_bodies():
			if overlap is Intermediate002:
				overlap.apply_central_impulse(Vector2(1000,100)*scale.x)
			
	pass # Replace with function body.
