extends Node2D

const DEADZONE = .25

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var controller_x =  Input.get_joy_axis(0,JOY_AXIS_RIGHT_X)
	var controller_y =  Input.get_joy_axis(0,JOY_AXIS_RIGHT_Y)
	if(abs(controller_x) > DEADZONE or abs(controller_y) >DEADZONE):
		rotation = (Vector2(controller_x,controller_y)).angle()
	
	pass
