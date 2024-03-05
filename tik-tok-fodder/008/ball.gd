extends RigidBody2D
class_name Ball008

@export var assigned_node : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	print(assigned_node)
	print(get_path_to(assigned_node))
	%RemoteTransform2D.remote_path = assigned_node.get_path()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
