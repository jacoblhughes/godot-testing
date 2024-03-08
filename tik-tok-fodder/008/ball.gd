extends RigidBody2D
class_name Ball008

@export var assigned_node : Node2D
@export var distance_marker : Marker2D
var braked = false
signal round_over
# Called when the node enters the scene tree for the first time.
func _ready():
	%RemoteTransform2D.remote_path = assigned_node.get_path()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):

	if abs(linear_velocity.x) < 50 and self.global_position.x > distance_marker.global_position.x:
		brake()

func brake():
	if !braked:
		braked = true
		var tween = get_tree().create_tween()
		tween.tween_property(self, "linear_velocity", Vector2.ZERO, 2)
		tween.finished.connect(_on_tween_finished)

func _on_tween_finished():
	print('here')
	linear_velocity = Vector2.ZERO
	round_over.emit()
