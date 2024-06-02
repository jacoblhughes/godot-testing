extends CharacterBody2D

@export var navigation_agent : NavigationAgent2D
@export var tile_map : TileMap
var dump_location
var garbage_locations : Array = []
var garbage_exists = false
var holding_garbage = false
var garbage_for_target = null
var garbage_for_target_location = null
var speed = 100
var acceleration = 7

# Get the gravity from the project settings to be synced with RigidBody nodes.
func _ready():
	navigation_agent.target_reached.connect(_on_target_reached)

#
func _physics_process(delta):
	var direction = Vector2.ZERO
	print(garbage_locations)
	if not garbage_locations.is_empty() and not garbage_exists:
		garbage_exists = true
		garbage_for_target = garbage_locations[0]
		garbage_for_target_location = tile_map.map_to_local(garbage_for_target)
		navigation_agent.target_position = garbage_for_target_location

	direction = navigation_agent.get_next_path_position() - global_position
	direction = direction.normalized()

	velocity = velocity.lerp(direction * speed, acceleration * delta)

	move_and_slide()

func provide_garbage(garbage_array):
	garbage_locations = garbage_array

func _on_target_reached():
	tile_map.erase_cell(3,garbage_for_target)
	garbage_exists = false
	garbage_locations.clear()
	pass
