extends CharacterBody2D

@export var navigation_agent : NavigationAgent2D
@export var tile_map : TileMap
var dump_location
var garbage_locations : Array = []
var garbage_seeking = false
var recycle_seeking = false
var holding_garbage = false
var garbage_for_target = null
var garbage_for_target_location = null
var speed = 100
var acceleration = 7
var max_garbage_storage = 2
var current_garbage_in_storage = 0
var recycle_location = null
# Get the gravity from the project settings to be synced with RigidBody nodes.
func _ready():
	navigation_agent.target_reached.connect(_on_target_reached)

#
func _physics_process(delta):
	_check_for_recycle_location()
	var direction = Vector2.ZERO
	if current_garbage_in_storage < max_garbage_storage and not garbage_locations.is_empty() and not garbage_seeking and not recycle_seeking:
		garbage_seeking= true
		garbage_for_target = garbage_locations[0]
		garbage_for_target_location = tile_map.map_to_local(garbage_for_target)
		navigation_agent.target_position = garbage_for_target_location

	if (current_garbage_in_storage > 0 or current_garbage_in_storage >= max_garbage_storage) and not recycle_location == null and not garbage_seeking and not recycle_seeking:
		recycle_seeking = true
		navigation_agent.target_position = recycle_location

	#if garbage_locations.is_empty() and not garbage_seeking and not recycle_seeking:
		#var new_location = tile_map.get_used_cells

	direction = navigation_agent.get_next_path_position() - global_position
	direction = direction.normalized()

	velocity = velocity.lerp(direction * speed, acceleration * delta)

	move_and_slide()

func provide_garbage(garbage_array):
	garbage_locations = garbage_array

func _on_target_reached():
	if garbage_seeking:
		tile_map.erase_cell(3,garbage_for_target)
		garbage_locations.clear()
		current_garbage_in_storage += 1
		garbage_seeking = false
	if recycle_seeking:
		recycle_seeking = false
		current_garbage_in_storage = 0

	pass

func _check_for_recycle_location():
	if tile_map.get_used_cells_by_id(0,0,Vector2i(0,3),false) != []:
		recycle_location = tile_map.map_to_local(tile_map.get_used_cells_by_id(0,0,Vector2i(0,3),false)[0])
	else:
		recycle_location = null
