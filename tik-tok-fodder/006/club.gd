extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("move_right"):
		self.rotation_degrees.x +=5
	if Input.is_action_just_pressed("move_left"):
		self.rotation_degrees.x -=5
	pass


func _on_rigid_body_3d_body_entered(body):
	if body is Ball006:
		body.apply_central_force(Vector3(0,0,500))
	pass # Replace with function body.
