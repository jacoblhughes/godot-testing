extends RigidBody2D
class_name Ball008

@export var assigned_node : Node2D
@export var distance_marker : Marker2D
# Called when the node enters the scene tree for the first time.
func _ready():
	print(assigned_node)
	print(get_path_to(assigned_node))
	%RemoteTransform2D.remote_path = assigned_node.get_path()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	print(linear_velocity.x)
	if linear_velocity.x < 50 and self.global_position.x > distance_marker.global_position.x:
		brake()

	pass

func brake():
	printerr("BRAKE")
	var tween = get_tree().create_tween()
	tween.tween_property(self, "linear_velocity", Vector2.ZERO, 1)

