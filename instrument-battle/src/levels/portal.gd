extends Node2D
class_name Portal
@export var destination_scene : String
@export var specific_portal_tag : String
@onready var marker = $Marker2D
# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body is Player:
		NavigationManager.go_to_level(destination_scene, specific_portal_tag)
		pass
	pass # Replace with function body.
