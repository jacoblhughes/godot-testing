extends CharacterBody2D


const SPEED = 25.0

func _physics_process(delta):

	var direction_x = Input.get_axis("move_left", "move_right")
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var direction_y = Input.get_axis("move_up", "move_down")
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
