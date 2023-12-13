extends CharacterBody2D


const SPEED = 35.0
@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var sprite : Sprite2D = $Sprite2D

func _physics_process(delta):
	var direction_x = Input.get_axis("move_left", "move_right")
	var direction_y = Input.get_axis("move_up", "move_down")

	# Reset velocity
	velocity = Vector2.ZERO

	# Prioritize horizontal movement
	if direction_x != 0:
		velocity.x = direction_x * SPEED
		if direction_x < 0:
			sprite.flip_h = true
		else:
			sprite.flip_h = false
		animation_player.play("move_side")
	# If no horizontal movement, check for vertical movement
	elif direction_y != 0:
		velocity.y = direction_y * SPEED
		if direction_y > 0:
			animation_player.play("move_down")
		else:
			animation_player.play("move_up")
	else:
		animation_player.stop()

	move_and_slide()
