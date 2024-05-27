extends CharacterBody2D

@export var start_position : Marker2D
@export var end_position : Marker2D

@export var navigation_agent: NavigationAgent2D

var moving_to_end = true
var can_move = false
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	get_parent().nodes_moved.connect(_on_nodes_moved)
	input_event.connect(_on_input_event)
	NavigationServer2D.map_set_cell_size(NavigationServer2D.get_maps()[0],16.0)
	NavigationServer2D.map_changed.connect(_on_map_ready)

	
func _on_nodes_moved():
	position = start_position.position
	show()
	await get_tree().create_timer(2).timeout
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if can_move:
		var direction = Vector2.ZERO
		navigation_agent.target_position = end_position.position
		direction = navigation_agent.get_next_path_position()-GameManager.get_cell_size()/2 - global_position
		direction = direction.normalized()
	
		velocity = 1000 * direction * delta
		move_and_slide()
	pass

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		get_parent().add_clicks(1)

func _on_tween_finished():
	_move()

func _move():
	#var tween = get_tree().create_tween()
	#tween.finished.connect(_on_tween_finished)
	#if moving_to_end:
		#tween.tween_property(self, "position",end_position.position, 5)
		#moving_to_end = false
		#return
	#else:
		#tween.tween_property(self, "position",start_position.position, 5)
		#moving_to_end = true
		#return

	pass
	
func _on_map_ready(map):
	can_move = true
