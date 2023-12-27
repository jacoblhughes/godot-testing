extends Node2D

var tinaville_scene = preload("res://src/tinaville.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	var tinaville = tinaville_scene.instantiate()
	get_tree().change_scene_to_packed(tinaville_scene)
	pass # Replace with function body.
