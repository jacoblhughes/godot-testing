extends Sprite2D

var next_coords : Vector2i = Vector2i.ZERO
var next_position : Vector2 = Vector2.ZERO
var can_move = false
@export var navigation_agent : NavigationAgent2D
@export var tile_map : TileMap
func _ready():
	next_coords =  Vector2i(29,13)
	NavigationServer2D.map_changed.connect(_on_map_ready)
	next_position = tile_map.map_to_local(next_coords)
	navigation_agent.target_reached.connect(_on_target_reached)

func _physics_process(delta):
	if can_move:
		var direction = Vector2.ZERO
		navigation_agent.target_position = next_position
		direction = navigation_agent.get_next_path_position() - global_position
		direction = direction.normalized()
		position += 50 * direction * delta

func _on_map_ready(map):
	can_move = true

func _on_target_reached():
	can_move = false
