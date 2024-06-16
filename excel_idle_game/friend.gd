extends CharacterBody2D


const speed = 300.0
const JUMP_VELOCITY = -400.0
var grass_cells
@export var navigation_agent : NavigationAgent2D
var position_set = false
# Get the gravity from the project settings to be synced with RigidBody nodes.

var grass_coord_position
func _ready():
	navigation_agent.target_reached.connect(_on_target_reached)
	pass

func _physics_process(delta):
	if !position_set:
		position_set = true
		grass_cells = get_parent().get_used_cells_by_id(0,0,Vector2i(0,2),-1)
		var grass_coord = grass_cells[randi_range(0,len(grass_cells))]
		var grass_coord_position = get_parent().map_to_local(grass_coord)
		# Add the gravity.
		var direction = Vector2.ZERO
		navigation_agent.target_position = grass_coord_position
		direction = navigation_agent.get_next_path_position() - global_position
		direction = direction.normalized()
		velocity = speed * direction * delta
	move_and_slide()


	move_and_slide()

func _on_target_reached():
	position_set = false
	pass
