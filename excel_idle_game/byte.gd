extends Area2D

var end_position : Vector2 = Vector2.ZERO
var can_move = true
@export var navigation_agent : NavigationAgent2D

func _ready():
	navigation_agent.target_reached.connect(_on_target_reached)


func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int):
	if event is InputEventMouseButton and event.pressed:
		print('points')

func _physics_process(delta):
	if can_move:
		var direction = Vector2.ZERO
		navigation_agent.target_position = end_position
		direction = navigation_agent.get_next_path_position() - global_position
		direction = direction.normalized()
		position += 50 * direction * delta

func _on_target_reached():
	can_move = false
	queue_free()
