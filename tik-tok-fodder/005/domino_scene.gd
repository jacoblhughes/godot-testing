extends Node3D

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

# Called when the node enters the scene tree for the first time.
func _ready():
	var domino_transform = get_transform()
	var new_up_vector = domino_transform.basis.y
#	var rotation_normalized = rotation.normalized()
	%Area3D.gravity_direction = -new_up_vector
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
