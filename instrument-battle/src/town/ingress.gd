extends Node2D

#var ingress_scene : PackedScene = preload("res://src/town/home.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body is Player:
#		var ingress = ingress_scene.instantiate()
		get_tree().change_scene_to_file("res://src/levels/town.tscn")
	pass # Replace with function body.
