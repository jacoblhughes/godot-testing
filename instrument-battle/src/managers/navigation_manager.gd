extends Node

const scene_arena = preload("res://src/levels/arena.tscn")
const scene_village = preload("res://src/levels/village.tscn")
const scene_home_inside = preload("res://src/town/home_inside.tscn")

var specific_portal_tag = "Home"
signal on_trigger_spawn
# Called when the node enters the scene tree for the first time.
func go_to_level(level_tag, destination_portal_tag):
	var scene_to_load
	
	match level_tag:
		"arena":
			scene_to_load = scene_arena
		"village":
			scene_to_load = scene_village
		"home_inside":
			scene_to_load = scene_home_inside
	get_tree().change_scene_to_packed(scene_to_load)
	if destination_portal_tag != null:
		specific_portal_tag = destination_portal_tag
		pass

func spawn_player(position):
	on_trigger_spawn.emit(position)

func on_level_spawn():
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
