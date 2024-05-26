extends Area2D

@export var start_position : Marker2D
@export var end_position : Marker2D
# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().nodes_moved.connect(_on_nodes_moved)
	input_event.connect(_on_input_event)
func _on_nodes_moved():
	print(start_position.position)
	position = start_position.position
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position",end_position.position, 5)
	tween.finished.connect(_on_tween_finished)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		print('herererer')

func _on_tween_finished():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position",start_position.position, 5)

	pass
