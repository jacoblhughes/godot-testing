extends CharacterBody2D

@export var start_position : Marker2D
@export var end_position : Marker2D

@export var navigation_agent: NavigationAgent2D

var moving_to_end = true
var can_move = false

func _ready():
	hide()
	get_parent().nodes_moved.connect(_on_nodes_moved)
	input_event.connect(_on_input_event)
	NavigationServer2D.map_changed.connect(_on_map_ready)


func _on_nodes_moved():
	position = start_position.position
	show()
	await get_tree().create_timer(2).timeout
	pass

func _physics_process(delta):
	if can_move:
		var direction = Vector2.ZERO
		navigation_agent.target_position = end_position.position
		direction = navigation_agent.get_next_path_position() - global_position
		direction = direction.normalized()
		velocity = 5000 * direction * delta
		move_and_slide()
	pass

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		get_parent().add_clicks(1)

func _on_tween_finished():

	pass

func _on_map_ready(map):
	can_move = true
