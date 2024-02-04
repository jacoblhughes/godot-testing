extends Node

const scene_arena = preload("res://src/levels/arena.tscn")
const scene_village = preload("res://src/levels/village.tscn")
const scene_home_inside = preload("res://src/town/home_inside.tscn")

var specific_portal_tag
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
#		if scene_to_load != null:
#			spawn_door_tag = destination_tag
	get_tree().change_scene_to_packed(scene_to_load)
	if destination_portal_tag != null:
		specific_portal_tag = destination_portal_tag
		pass

func spawn_player(position):
	on_trigger_spawn.emit(position)
	
