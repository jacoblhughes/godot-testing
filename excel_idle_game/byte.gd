extends CharacterBody2D

var end_position : Vector2 = Vector2.ZERO
var can_move = true
var cell_size = Vector2i.ZERO
var astar_grid = AStarGrid2D.new()
var grid_size = Vector2i.ZERO
var tile_map : TileMap
@export var navigation_agent : NavigationAgent2D
signal clicked_on
var direction = Vector2.ZERO
var speed = 7500

func _ready():
	#astar_grid.region = tile_map.get_used_cells_by_id(0,0,Vector2i(0,1))
	#astar_grid.cell_size = GameManager.get_cell_size()
	#astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	#astar_grid.update()

	#NavigationServer2D.map_get_path(0,,,false)
	#navigation_agent.pathfinding_algorithm = NavigationPathQueryParameters2D.PATHFINDING_ALGORITHM_ASTAR
	navigation_agent.target_reached.connect(_on_target_reached)
	%ClickArea.input_event.connect(_on_click_area_input_event)

func _on_click_area_input_event(viewport: Viewport, event: InputEvent, shape_idx: int):
	if event is InputEventMouseButton and event.pressed:
		clicked_on.emit()
		begone()

func _physics_process(delta):
	if can_move:
		var direction = Vector2.ZERO
		navigation_agent.target_position = end_position
		direction = navigation_agent.get_next_path_position() - global_position
		direction = direction.normalized()
		velocity = speed * direction * delta
		move_and_slide()

func _on_target_reached():

	can_move = false
	begone()

func begone():
	queue_free()
