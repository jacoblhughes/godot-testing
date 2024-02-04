extends Node2D

@export var winning_score = 9
signal arena_finished
var new_arena
# Called when the node enters the scene tree for the first time.
func _ready():
#	%UI/Control/Label.text = str(0)
	for nodes in get_tree().get_nodes_in_group("enemies"):
		nodes.remove_from_group("enemies")
		nodes.queue_free()
	new_arena = true
	$Start.start.connect(_on_start)
	_on_level_spawn()
	print('arenaaa')
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_level_spawn():
	print(NavigationManager.specific_portal_tag)
	if NavigationManager.specific_portal_tag != null and NavigationManager.specific_portal_tag != "":
		for portals in  get_tree().get_nodes_in_group("portals"):

			if portals.name == NavigationManager.specific_portal_tag:
				var portal = portals as Portal
				NavigationManager.spawn_player(portal.marker.global_position)
	else:
		for portals in  get_tree().get_nodes_in_group("portals"):
			print(portals)
			var portal = portals as Portal
			NavigationManager.spawn_player(portal.marker.global_position)

# Called every fleverame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
	pass
	_check_status()

func _check_status():
	if GameManager.return_score() >= winning_score:
		arena_finished.emit()
		get_tree().call_group("enemies", "fade_away")
		new_arena = false


func _on_start():
	if new_arena:
		$EnemySpawn.start_timer()
		
	pass # Replace with function body.
