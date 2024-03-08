extends Area2D

@onready var punch = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for item in %Swing.get_overlapping_bodies():

		if item is Ball008 and Input.is_action_just_pressed("move_right"):

			item.apply_central_impulse(Vector2(punch,0))
	pass
	

