extends Camera3D

# Member variables
var collision_exception = []
@export var min_distance = 0.5
@export var max_distance = 3.0
@export var angle_v_adjust = 0.0
var max_height = 2.0
var min_height = 0
@onready var target_node: Node3D = get_parent()


func _ready():
	pass


func _physics_process(_delta):
	var target_pos: Vector3 = target_node.global_transform.origin
	var camera_pos: Vector3 = global_transform.origin

	var delta_pos: Vector3 = camera_pos - target_pos

	# Regular delta follow

	# Check ranges
	if delta_pos.length() < min_distance:
		delta_pos = delta_pos.normalized() * min_distance
	elif delta_pos.length() > max_distance:
		delta_pos = delta_pos.normalized() * max_distance

	# Check upper and lower height
	if delta_pos.y > max_height:
		delta_pos.y = max_height
	if delta_pos.y < min_height:
		delta_pos.y = min_height

	camera_pos = target_pos + delta_pos

	look_at_from_position(camera_pos, target_pos, Vector3.UP)

	# Turn a little up or down
	var t = transform
	t.basis = Basis(t.basis[0], deg_to_rad(angle_v_adjust)) * t.basis
	transform = t
