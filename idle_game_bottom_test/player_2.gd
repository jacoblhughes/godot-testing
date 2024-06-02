extends CharacterBody2D
@export var navigation_agent: NavigationAgent2D
@export var tile_map : TileMap
const SPEED = 50.0
var can_move = false
var direction = Vector2.ZERO
var next_coords : Vector2i = Vector2i.ZERO
var next_position = Vector2.ZERO
# Get the gravity from the prsoject settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():

	next_coords = tile_map.local_to_map(global_position) + Vector2i(1,0)

	NavigationServer2D.map_changed.connect(_on_map_ready)
	next_position = tile_map.map_to_local(next_coords)


func _physics_process(delta):
	if can_move:
		var direction = Vector2.ZERO
		
		navigation_agent.target_position = next_position
		direction = navigation_agent.get_next_path_position() - global_position
		direction = direction.normalized()
		velocity = 5000 * direction * delta
		move_and_slide()

func _on_map_ready(map):
	can_move = true
