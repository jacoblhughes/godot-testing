extends CharacterBody2D

@export var navigation_agent : NavigationAgent2D
@export var tile_map : TileMap
@export var animated_sprite : AnimatedSprite2D
var dump_location
var garbage_locations : Array = []
var garbage_seeking = false
var recycle_seeking = false
var holding_garbage = false
var garbage_for_target = null
var garbage_for_target_location = null
var speed = 75
var acceleration = 7
var max_garbage_storage = 2
var current_garbage_in_storage = 0
var recycle_location = null
var wandering = false
var can_move = false
var collecting = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
func _ready():
	navigation_agent.target_reached.connect(_on_target_reached)
	call_deferred("_call_deferred")

func _call_deferred():
	can_move = true

func _physics_process(delta):
	if not collecting:
		_check_for_ground()
	_check_for_recycle_location()
	var direction = Vector2.ZERO
	if can_move:
		if current_garbage_in_storage < max_garbage_storage and not garbage_locations.is_empty() and not garbage_seeking and not recycle_seeking:
			garbage_seeking= true
			garbage_for_target = garbage_locations[randi() % garbage_locations.size() ]
			garbage_for_target_location = tile_map.map_to_local(garbage_for_target)
			navigation_agent.target_position = garbage_for_target_location

		if (current_garbage_in_storage > 0 or current_garbage_in_storage >= max_garbage_storage) and not recycle_location == null and not garbage_seeking and not recycle_seeking:
			recycle_seeking = true
			navigation_agent.target_position = recycle_location

		if garbage_locations.is_empty() and not garbage_seeking and not recycle_seeking and not wandering:
			wandering = true
			var wandering_coords_cells = tile_map.get_used_cells(0)
			var wandering_coords = wandering_coords_cells[randi() % wandering_coords_cells.size()]
			var wandering_target_location = tile_map.map_to_local(wandering_coords)
			navigation_agent.target_position = wandering_target_location

		direction = navigation_agent.get_next_path_position() - global_position
		direction = direction.normalized()

		velocity = velocity.lerp(direction * speed, acceleration * delta)
	if not collecting:
		if velocity.x < 0:
			animated_sprite.set_flip_h(true)
		else:
			animated_sprite.set_flip_h(false)
	move_and_slide()

func provide_garbage(garbage_array):
	garbage_locations = garbage_array

func _on_target_reached():
	if garbage_seeking:
		collecting = true
		animated_sprite.play('collecting')
		tile_map.erase_cell(3,garbage_for_target)
		garbage_locations.clear()
		await animated_sprite.animation_finished
		current_garbage_in_storage += 1
		garbage_seeking = false
		collecting = false
	if recycle_seeking:
		recycle_seeking = false
		current_garbage_in_storage = 0
	if wandering:
		wandering = false

	pass

func _check_for_recycle_location():
	if tile_map.get_used_cells_by_id(0,0,Vector2i(0,3),false) != []:
		recycle_location = tile_map.map_to_local(tile_map.get_used_cells_by_id(0,0,Vector2i(0,3),false)[randi() % tile_map.get_used_cells_by_id(0,0,Vector2i(0,3),false).size()])
	else:
		recycle_location = null

func _check_for_ground():
	var current_coords = tile_map.local_to_map(position)
	var tile_data = tile_map.get_cell_tile_data(0, current_coords, false)
	var base_type = tile_data.get_custom_data("base_type")
	if base_type == 'water':
		animated_sprite.play("swimming")
	elif base_type == 'ground':
		animated_sprite.play("walking")
	pass
