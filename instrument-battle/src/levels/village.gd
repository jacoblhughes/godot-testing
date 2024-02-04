extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if NavigationManager.village_tag != null:
		_on_level_spawn(NavigationManager.village_tag)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_level_spawn(tag):
	print(tag)
	var portal_path = "Portals/" + tag
	var portal = get_node(portal_path) as Portal
	NavigationManager.village_spawn_player(portal.marker.global_position)
