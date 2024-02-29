extends StaticBody2D

const SPEED = Vector2(100,0)
@export var clockwise = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass
	
func run_conveyor():
	if clockwise == true:
		self.constant_linear_velocity = SPEED
		for node in get_children():
			if node is AnimatedSprite2D:
				node.play('clockwise')
	elif clockwise == false:
		print('nah')
		self.constant_linear_velocity = -SPEED
		for node in get_children():
			if node is AnimatedSprite2D:
				node.play('counterclockwise')
