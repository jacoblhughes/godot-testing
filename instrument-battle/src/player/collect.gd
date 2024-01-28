extends Node2D

var attraction_strength = 10.0
var attracted_areas : Array = []  # To store attracted Area2D objects


func _ready():
	pass

func _process(delta):
	for area in attracted_areas:		
		var force = (global_position - area.global_position).normalized() * attraction_strength
		area.global_position += force * delta

func _on_area_2d_area_entered(area):
	if area is Treasure:
		if area not in attracted_areas:
			attracted_areas.append(area)
			area.collected.connect(_on_treasure_collected)
			
func _on_area_2d_area_exited(area):
	if area in attracted_areas:
		attracted_areas.erase(area)
		area.collected.disconnect(_on_treasure_collected)

func _on_treasure_collected(treasure):
	if treasure in attracted_areas:
		attracted_areas.erase(treasure)
		treasure.queue_free()
