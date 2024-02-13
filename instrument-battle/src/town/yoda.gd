extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var distance_to_player = global_position.distance_to(%Player.global_position)
	var direction = global_position.direction_to(%Player.global_position)
	var direction_normalized = global_position.direction_to(%Player.global_position).normalized()
	if distance_to_player < 20:
		if direction_normalized.x >=0:			
			$AnimatedSprite2D.play("sit_face_right")
		else: 
			$AnimatedSprite2D.play("sit_face_left")
		velocity = Vector2.ZERO
	else:
		if abs(direction_normalized).x < abs(direction_normalized).y:
			if direction_normalized.y > 0:
				$AnimatedSprite2D.play("down")
			else:
				$AnimatedSprite2D.play("up")
		else:
			if direction_normalized.x > 0:
				$AnimatedSprite2D.play("right")
			else:
				$AnimatedSprite2D.play("left")

	

		velocity = direction * 100
	move_and_slide()
