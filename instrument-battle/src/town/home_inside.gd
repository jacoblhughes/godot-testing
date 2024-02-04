extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	_on_level_spawn()

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
			var portal = portals as Portal
			NavigationManager.spawn_player(portal.marker.global_position)
