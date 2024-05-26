extends Area2D

@export var start_position : Marker2D
@export var end_position : Marker2D
var moving_to_end = true
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	get_parent().nodes_moved.connect(_on_nodes_moved)
	input_event.connect(_on_input_event)

func _on_nodes_moved():
	position = start_position.position
	show()
	await get_tree().create_timer(2).timeout
	_move()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		get_parent().add_clicks(1)

func _on_tween_finished():
	_move()

func _move():
	var tween = get_tree().create_tween()
	tween.finished.connect(_on_tween_finished)
	if moving_to_end:
		tween.tween_property(self, "position",end_position.position, 5)
		moving_to_end = false
		return
	else:
		tween.tween_property(self, "position",start_position.position, 5)
		moving_to_end = true
		return

	pass
