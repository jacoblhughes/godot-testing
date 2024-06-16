extends CharacterBody2D

@export var cpu_particles : CPUParticles2D

const speed = 3000.0
var grass_cells

var position_set = false
var board_tilemap
var grass_coord_position
var grass_coord

func _ready():

	pass

func _physics_process(delta):
	var direction = Vector2.ZERO
	if !position_set:
		position_set = true
		grass_cells = board_tilemap.get_used_cells_by_id(0,0,Vector2i(0,2),-1)
		grass_coord = grass_cells[randi_range(0,len(grass_cells)-1)]
		grass_coord_position = board_tilemap.map_to_local(grass_coord)
		direction = grass_coord_position - global_position
		direction = direction.normalized()
		velocity = speed * direction * delta
	move_and_slide()
	if global_position.distance_to(grass_coord_position) <= 20:
		on_target_reached()
	if velocity != Vector2.ZERO:
		cpu_particles.direction = -direction
		cpu_particles.spread = 0
	else:
		cpu_particles.direction = Vector2.ZERO
		cpu_particles.spread = 180
func on_target_reached():
	position_set = false
	velocity = Vector2.ZERO
	pass
