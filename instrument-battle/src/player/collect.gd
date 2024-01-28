extends Node2D

var attraction_strength = 10.0
var attracted_areas : Array = []  # To store attracted Area2D objects

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_area_2d_area_entered(area):
	if area is Treasure:
		attracted_areas.append(area)

func _on_area_exited(area):
	# Remove the exited object from the list of attracted areas
	if area in attracted_areas:
		attracted_areas.erase(area)

func _process(delta):
	# Calculate and apply attraction force to all attracted areas
	for area in attracted_areas:
		var force = (global_position - area.global_position).normalized() * attraction_strength
		area.global_position += force * delta
