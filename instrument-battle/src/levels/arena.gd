extends Node2D

@export var winning_score = 9
signal arena_finished
var new_arena
@export var needed_kills = 3
var current_kills = 0
# Called when the node enters the scene tree for the first time.
func _ready():
#	%UI/Control/Label.text = str(0)
	for nodes in get_tree().get_nodes_in_group("enemies"):
		nodes.remove_from_group("enemies")
		nodes.queue_free()
	new_arena = true
	$Start.start.connect(_on_start)
	NavigationManager.on_level_spawn()
	%StagePortal.turn_off_portal()
	UI.set_arena_enemies_left(needed_kills)
	pass # Replace with function body.

# Called every fleverame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_check_status()

func _check_status():

	if current_kills >= needed_kills:
		arena_finished.emit()
		get_tree().call_group("enemies", "fade_away")
		new_arena = false
		%StagePortal.turn_on_portal()

func _on_start():
	if new_arena:
		$EnemySpawn.start_timer()
		
	pass # Replace with function body.

func _add_kill():
	current_kills += 1
	UI.set_arena_enemies_left(needed_kills-current_kills)
